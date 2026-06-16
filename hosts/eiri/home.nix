_: {
  imports = [
    ../../modules/common
    ./wezterm.nix
  ];

  home = {
    stateVersion = "25.05";
    username = "kagu";
    homeDirectory = "/home/kagu";
  };
}
