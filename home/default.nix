_: {
  imports = [
    ./packages.nix
    ./git.nix
    ./zsh.nix
  ];

  home = {
    stateVersion = "24.11";
    username = "kagu";
    homeDirectory = "/Users/kagu";
  };
}
