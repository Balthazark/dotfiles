{ ... }: {
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      # Uninstall any cask not listed here on rebuild — keeps config authoritative
      cleanup = "zap";
    };
    casks = [
      "slack"
      "microsoft-teams"
      "microsoft-outlook"
      "google-chrome"
      "rekordbox"
      "obsidian"
      "figma"
    ];
  };
}
