_: {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "*" = {
        addKeysToAgent = "yes";
        extraOptions.UseKeychain = "yes";
      };
      "github.com" = {
        user = "git";
        identityFile = "~/.ssh/id_ed25519";
      };
    };
  };
}
