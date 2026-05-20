_: {
  system.defaults = {
    dock = {
      autohide = true;
      autohide-delay = 0.0; # no delay before dock appears
      autohide-time-modifier = 0.2; # animation speed in seconds
      show-recents = false;
      tilesize = 48;
      orientation = "bottom";
      minimize-to-application = true; # minimize into app icon, not separate tile
    };

    finder = {
      AppleShowAllExtensions = true;
      ShowPathbar = true;
      ShowStatusBar = true;
      FXPreferredViewStyle = "Nlsv"; # list view (icnv=icon, clmv=column, Flwv=gallery)
      QuitMenuItem = true; # allow Cmd+Q to quit Finder
    };

    trackpad = {
      Clicking = true; # tap to click
      TrackpadRightClick = true; # two-finger tap = right click
    };

    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      InitialKeyRepeat = 15; # delay before repeat starts (Apple default: 68; lower = faster)
      KeyRepeat = 2; # repeat rate (Apple default: 6; lower = faster)
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false; # double-space → period
      "com.apple.swipescrolldirection" = true;
    };

    screencapture = {
      location = "~/Desktop";
      type = "png";
    };

    loginwindow = {
      GuestEnabled = false;
    };
  };
}
