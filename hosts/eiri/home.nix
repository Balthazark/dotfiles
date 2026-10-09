{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ../../modules/common
    ./fonts.nix
    ./windowsterminal.nix
  ];

  programs = {
    git.settings.credential.helper = "store";

    # The company gateway URL is internal, so it lives in a local file instead of this repo.
    zsh.initContent = ''
      [[ -r ${config.xdg.configHome}/anthropic/base-url ]] && export ANTHROPIC_BASE_URL="$(<${config.xdg.configHome}/anthropic/base-url)"
    '';
  };

  home = {
    stateVersion = "25.05";
    username = "kagu";
    homeDirectory = "/home/kagu";
    packages = [
      pkgs.github-copilot-cli
      pkgs.uv
      pkgs.python311
    ];

    # Merge only apiKeyHelper into a writable settings.json, so Claude Code can still save
    # its own settings (/model, /effort, theme). The key file itself is created by hand with mode 600.
    activation.claudeApiKeyHelper = lib.hm.dag.entryAfter [ "linkGeneration" ] ''
      settings="${config.home.homeDirectory}/.claude/settings.json"
      helper="cat ${config.xdg.configHome}/anthropic/api-key"
      if [[ ! -v DRY_RUN ]]; then
        mkdir -p "$(dirname "$settings")"
        [[ -s $settings ]] || echo '{}' > "$settings"
        tmp="$(mktemp "$settings.XXXXXX")"
        if ${lib.getExe pkgs.jq} --arg helper "$helper" '.apiKeyHelper = $helper' "$settings" > "$tmp"; then
          mv "$tmp" "$settings"
        else
          rm -f "$tmp"
          warnEcho "Could not update $settings: the file is not valid JSON."
        fi
      fi
    '';
  };
}
