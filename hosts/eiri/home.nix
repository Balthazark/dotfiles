{ pkgs, ... }: {
  imports = [
    ../../modules/common
    ./ghostty.nix
  ];

  home = {
    stateVersion = "25.05";
    username = "kagu";
    homeDirectory = "/home/kagu";
    packages = [ pkgs.github-copilot-cli ];
  };
}
