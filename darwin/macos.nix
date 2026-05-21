_: {
  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToControl = true;
  };

  # remapCapsLockToControl alone resets per-keyboard on reboot; hidutil re-applies it at every login
  launchd.user.agents.hidutil-caps-to-ctrl = {
    serviceConfig = {
      ProgramArguments = [
        "/usr/bin/hidutil"
        "property"
        "--set"
        ''{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":30064771129,"HIDKeyboardModifierMappingDst":30064771296}]}''
      ];
      RunAtLoad = true;
      KeepAlive = false;
    };
  };

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
      location = "~/Pictures/Screenshots";
      type = "png";
    };

    loginwindow = {
      GuestEnabled = false;
    };
  };
}
