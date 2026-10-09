{ config, pkgs, ... }: {
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

    claude-code = {
      enable = true;
      # modules/common/packages.nix already installs pkgs.claude-code.
      package = null;
      settings = {
        theme = "dark";
        model = "opus";
        # The key stays out of the world-readable Nix store; create this file by hand with mode 600.
        apiKeyHelper = "cat ${config.xdg.configHome}/anthropic/api-key";
      };
    };
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
  };
}
