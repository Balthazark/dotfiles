_: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      drb = "sudo darwin-rebuild switch --flake ~/git/dotfiles#navi";
    };
  };
}
