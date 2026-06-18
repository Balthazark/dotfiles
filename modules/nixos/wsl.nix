_: {
  wsl = {
    enable = true;
    defaultUser = "kagu";
  };

  # Allow generic dynamically-linked binaries (e.g. VS Code server, downloaded Node)
  programs.nix-ld.enable = true;
}
