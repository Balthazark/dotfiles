{ lib, ... }:
{
  imports = [
    ../../modules/common
    ./ssh.nix
    ./ghostty.nix
    ./wallpaper.nix
  ];

  home = {
    stateVersion = "24.11";
    username = "kagu";
    homeDirectory = "/Users/kagu";
    activation.createScreenshotsDir = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      mkdir -p "$HOME/Pictures/Screenshots"
    '';
  };
}
