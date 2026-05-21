_: {
  launchd.agents.ssh-add = {
    config = {
      ProgramArguments = [
        "/usr/bin/ssh-add"
        "--apple-load-keychain"
      ];
      RunAtLoad = true;
    };
  };

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
