_: {
  services.yabai = {
    enable = true;
    enableScriptingAddition = true;
    config = {
      layout = "bsp";
      window_placement = "second_child";
      top_padding = 12;
      bottom_padding = 12;
      left_padding = 12;
      right_padding = 12;
      window_gap = 12;
      mouse_follows_focus = "on";
      mouse_modifier = "alt";
      mouse_action1 = "move";
      mouse_action2 = "resize";
      mouse_drop_action = "swap";
      window_shadow = "off";
    };
    extraConfig = ''
      sudo yabai --load-sa
      yabai -m signal --add event=dock_did_restart action="sudo yabai --load-sa"

      yabai -m rule --add app="^System Settings$" manage=off
      yabai -m rule --add app="^Calculator$" manage=off
      yabai -m rule --add app="^Finder$" manage=off

      yabai -m rule --add app="^Ghostty$" space=1
      yabai -m rule --add app="^Google Chrome$" space=2
      yabai -m rule --add app="^Obsidian$" space=3
      yabai -m rule --add app="^Slack$" space=4
      yabai -m rule --add app="^Microsoft Teams$" space=5
      yabai -m rule --add app="^rekordbox 7$" space=6

      yabai -m signal --add app='^Ghostty$' event=window_created action='yabai -m space --layout bsp'
      yabai -m signal --add app='^Ghostty$' event=window_destroyed action='yabai -m space --layout bsp'
    '';
  };
}
