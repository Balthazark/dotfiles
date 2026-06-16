_: {
  services.skhd = {
    enable = true;
    skhdConfig = ''
      # change window focus within space
      alt - h : yabai -m window --focus west
      alt - j : yabai -m window --focus south
      alt - k : yabai -m window --focus north
      alt - l : yabai -m window --focus east

      # change focus between external displays
      alt - s : yabai -m display --focus west
      alt - g : yabai -m display --focus east

      # toggle window float
      shift + alt - t : yabai -m window --toggle float --grid 4:4:1:1:2:2

      # maximize a window
      shift + alt - m : yabai -m window --toggle zoom-fullscreen

      # swap windows
      shift + alt - h : yabai -m window --swap west
      shift + alt - j : yabai -m window --swap south
      shift + alt - k : yabai -m window --swap north
      shift + alt - l : yabai -m window --swap east

      # move window and split
      cmd + ctrl - h : yabai -m window --warp west
      cmd + ctrl - j : yabai -m window --warp south
      cmd + ctrl - k : yabai -m window --warp north
      cmd + ctrl - l : yabai -m window --warp east

      # move window to display left and right
      shift + alt - s : yabai -m window --display west; yabai -m display --focus west;
      shift + alt - g : yabai -m window --display east; yabai -m display --focus east;

      # switch to space
      ctrl - 1 : yabai -m space --focus 1
      ctrl - 2 : yabai -m space --focus 2
      ctrl - 3 : yabai -m space --focus 3
      ctrl - 4 : yabai -m space --focus 4
      ctrl - 5 : yabai -m space --focus 5
      ctrl - 6 : yabai -m space --focus 6

      # move window to space
      cmd + ctrl - 1 : yabai -m window --space 1;
      cmd + ctrl - 2 : yabai -m window --space 2;
      cmd + ctrl - 3 : yabai -m window --space 3;
      cmd + ctrl - 4 : yabai -m window --space 4;
      cmd + ctrl - 5 : yabai -m window --space 5;
      cmd + ctrl - 6 : yabai -m window --space 6;

      # restart yabai
      cmd + ctrl - r : yabai --restart-service
    '';
  };
}
