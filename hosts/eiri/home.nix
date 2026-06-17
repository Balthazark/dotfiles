{ pkgs, ... }: {
  imports = [
    ../../modules/common
    ./fonts.nix
    ./windowsterminal.nix
  ];

  programs.git.settings.credential.helper = "store";

  home = {
    stateVersion = "25.05";
    username = "kagu";
    homeDirectory = "/home/kagu";
    packages = [
      pkgs.github-copilot-cli
      pkgs.uv
      pkgs.python311
    ];
  };
}
