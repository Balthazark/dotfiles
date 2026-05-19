{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    defaultKeymap = "viins";

    history = {
      size = 5000;
      ignoreDups = true;
      ignoreSpace = true;
      share = true;
    };

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

    shellAliases = {
      drb = "sudo darwin-rebuild switch --flake ~/git/dotfiles#navi";
      ls = "eza --icons=always";
      vim = "nvim";
      c = "clear";
      nf = "nvim $(fzf -m --preview='bat --color=always {}')";
      bf = "fzf -m --preview='bat --color=always {}'";
    };

    initContent = ''
      source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh

      setopt hist_ignore_all_dups hist_save_no_dups hist_find_no_dups

      bindkey -M viins '^E' autosuggest-accept
      bindkey '^p' history-search-backward
      bindkey '^n' history-search-forward

      export LS_COLORS="$(vivid generate catppuccin-mocha)"

      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
      zstyle ':completion:*' menu no
      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --icons=always --color=always $realpath'
      zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza --icons=always --color=always $realpath'
    '';
  };

  programs.fzf = {
    enable = true;
    colors = {
      "bg+" = "#313244";
      bg = "#1e1e2e";
      spinner = "#f5e0dc";
      hl = "#f38ba8";
      fg = "#cdd6f4";
      header = "#f38ba8";
      info = "#cba6f7";
      pointer = "#f5e0dc";
      marker = "#b4befe";
      "fg+" = "#cdd6f4";
      prompt = "#cba6f7";
      "hl+" = "#f38ba8";
      "selected-bg" = "#45475a";
      border = "#313244";
      label = "#cdd6f4";
    };
  };

  programs.zoxide = {
    enable = true;
    options = [ "--cmd" "cd" ];
  };
}
