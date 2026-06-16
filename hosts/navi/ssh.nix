_: {
  launchd.agents.ssh-add = {
    enable = true;
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
    settings = {
      "*" = {
        AddKeysToAgent = "yes";
        UseKeychain = "yes";
      };
      "github.com" = {
        User = "git";
        IdentityFile = "~/.ssh/id_ed25519";
      };
    };
  };
}
