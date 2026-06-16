{ lib, ... }:
{
  home.activation.createAllowedSigners = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    echo "karlgunnarsson98@gmail.com $(cat ~/.ssh/id_ed25519.pub)" > ~/.ssh/allowed_signers
  '';

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Karl Gunnarsson";
        email = "karlgunnarsson98@gmail.com";
        signingKey = "~/.ssh/id_ed25519.pub";
      };
      init.defaultBranch = "main";
      core.editor = "nvim";
      commit.gpgsign = true;
      gpg.format = "ssh";
      gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
    };
  };
}
