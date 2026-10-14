{ ... }: {
  home.username = "root";
  home.homeDirectory = "/root";

  home.sessionVariables = {
    LANG = "C.utf8";
    LC_CTYPE = "C.utf8";
  };

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "26.05";
}
