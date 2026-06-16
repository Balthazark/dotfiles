{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty-bin;
    settings = {
      theme = "Catppuccin Mocha";
      font-size = 14;
      font-thicken = true;
      mouse-hide-while-typing = true;
      window-padding-x = 10;
      window-padding-y = 10;
      macos-titlebar-proxy-icon = "hidden";
      progress-style = false;
      keybind = [
        "super+shift+h=goto_split:left"
        "super+shift+l=goto_split:right"
        "super+shift+j=goto_split:bottom"
        "super+shift+k=goto_split:top"
      ];
    };
  };
}
