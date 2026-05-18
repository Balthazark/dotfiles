{ pkgs, ... }:
{
  home.packages = [
    pkgs.claude-code
    pkgs.gh
    pkgs.statix
    pkgs.deadnix
  ];
}
