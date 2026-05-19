_: {
  programs.git = {
    enable = true;
    settings = {
      user.name = "Karl Gunnarsson";
      user.email = "karlgunnarsson98@gmail.com";
      init.defaultBranch = "main";
      core.editor = "nvim";
    };
  };
}
