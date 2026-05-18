{ ... }: {
  imports = [
    ./packages.nix
    ./git.nix
    ./zsh.nix
  ];

  home.stateVersion = "24.11";
  home.username = "kagu";
  home.homeDirectory = "/Users/kagu";
}
