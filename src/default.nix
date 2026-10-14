{ ... }: {
  home.username = "root";
  home.homeDirectory = "/root";

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "26.05";
}
