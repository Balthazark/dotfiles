_: {
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
      extraFlags = [ "--force" ];
    };
    casks = [
      "ghostty"
      "google-chrome"
      "figma"
      "microsoft-teams"
      "microsoft-word"
      "obsidian"
      "rekordbox"
      "slack"
    ];
    masApps = {
      Plash = 1494023538;
    };
  };
}
