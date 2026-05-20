_: {
  imports = [
    ./packages.nix
    ./git.nix
    ./ssh.nix
    ./zsh.nix
    ./bat.nix
    ./ghostty.nix
    ./starship.nix
  ];

  home = {
    stateVersion = "24.11";
    username = "kagu";
    homeDirectory = "/Users/kagu";
  };
}
