{
  inputs = {    
    import-tree.url = "github:denful/import-tree";

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager-vscode-server-machine-settings.url = "github:yueyinqiu/HomeManagerVscodeServerMachineSettings";
    never-idle.url = "github:yueyinqiu/NeverIdleNix";
  };

  outputs = inputs: {
    homeConfigurations.root =
      let
        system = "x86_64-linux";
      in
      inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages.${system};
        extraSpecialArgs = {
          never-idle = inputs.never-idle.packages.${system};
        };
        modules = [
          inputs.home-manager-vscode-server-machine-settings.homeManagerModules.home-manager-vscode-server-machine-settings
          (inputs.import-tree ./src)
        ];
      };

    devShells = inputs.nixpkgs.lib.genAttrs inputs.nixpkgs.lib.systems.flakeExposed (system: {
      default = import ./dev {
        pkgs = inputs.nixpkgs.legacyPackages.${system};
      };
    });
  };
}
