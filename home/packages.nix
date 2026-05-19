{ pkgs, ... }:
{
  home.packages = [
    pkgs.claude-code
    pkgs.eza
    pkgs.gh
    pkgs.statix
    pkgs.deadnix
    pkgs.nixd
    pkgs.neovim
    pkgs.vivid
  ];
}
