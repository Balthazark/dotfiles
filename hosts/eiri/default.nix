{ pkgs, ... }:
{
  imports = [
    ../../modules/nixos
  ];

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (pkgs.lib.getName pkg) [
      "claude-code"
      "github-copilot-cli"
    ];

  networking.hostName = "eiri";
  system.stateVersion = "25.05";
  nixpkgs.hostPlatform = "x86_64-linux";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  programs.zsh.enable = true;

  environment.extraInit = ''
    export XDG_DATA_DIRS="/etc/profiles/per-user/kagu/share:$XDG_DATA_DIRS"
  '';

  systemd.tmpfiles.rules = [
    "d /usr/share/applications 0755 root root -"
    "L+ /usr/share/applications/com.mitchellh.ghostty.desktop - - - - ${pkgs.ghostty}/share/applications/com.mitchellh.ghostty.desktop"
  ];

  fonts.packages = [ pkgs.nerd-fonts.jetbrains-mono ];

  users.users.kagu = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };
}
