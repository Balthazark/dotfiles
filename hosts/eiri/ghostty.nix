{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty;
    settings = {
      theme = "Catppuccin Mocha";
      font-size = 14;
      progress-style = false;
      mouse-hide-while-typing = true;
      window-padding-x = 10;
      window-padding-y = 10;
      keybind = [
        "super+shift+h=goto_split:left"
        "super+shift+l=goto_split:right"
        "super+shift+j=goto_split:bottom"
        "super+shift+k=goto_split:top"
      ];
    };
  };
}
