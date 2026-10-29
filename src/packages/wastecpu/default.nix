{ pkgs, ... }:
let
  wastecpu = pkgs.writeShellApplication {
    name = "wastecpu";
    text = ''
      echo "wastecpu: pid=$$"
      while :; do :; done
    '';
  };
in {
  home.packages = [ wastecpu ];
}