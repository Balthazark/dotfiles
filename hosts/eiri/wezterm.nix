_: {
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local wezterm = require 'wezterm'
      local config = wezterm.config_builder()

      config.color_scheme = 'Catppuccin Mocha'
      config.font = wezterm.font 'JetBrainsMono Nerd Font Mono'
      config.font_size = 14.0
      config.window_padding = { left = 10, right = 10, top = 10, bottom = 10 }
      config.hide_mouse_cursor_when_typing = true

      return config
    '';
  };
}
