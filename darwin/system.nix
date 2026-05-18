{ pkgs, ... }:
{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  networking.hostName = "navi";
  system.primaryUser = "kagu";

  users.users.kagu.home = "/Users/kagu";

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (pkgs.lib.getName pkg) [
      "claude-code"
    ];

  system.stateVersion = 5;
  nixpkgs.hostPlatform = "aarch64-darwin";
}
