{ pkgs, ... }: {
  home.packages = [
    pkgs.claude-code
    pkgs.gh
  ];
}
