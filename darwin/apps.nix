{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.ghostty-bin
    pkgs.google-chrome
    pkgs.obsidian
    pkgs.slack
  ];
}
