{ pkgs, ... }:
{
  imports = [
    ../../modules/nixos
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [ "claude-code" ];

  networking.hostName = "eiri";
  system.stateVersion = "25.05";
  nixpkgs.hostPlatform = "x86_64-linux";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  programs.zsh.enable = true;

  fonts.packages = [ pkgs.nerd-fonts.jetbrains-mono ];

  users.users.kagu = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };
}
