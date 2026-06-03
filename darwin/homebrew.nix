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
      "obsidian"
      "rekordbox"
      "slack"
    ];
  };
}
