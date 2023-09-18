{
  description = "Paulo's MacOS Flake";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-23.05";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, darwin, ...}: {
    darwinConfigurations.MacBook-of-Filho =
      darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        pkgs = import nixpkgs {
          system = "aarch64-darwin";
          config = { allowUnfree = true; };
        };
        modules = [
          ./modules/darwin
          # Needed this to fix conflicting homeDirectory issue
          {
            users.users.paulo.home = "/Users/paulo";
          }

          # Home-Manager
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.paulo.imports = [ ./modules/home-manager ];
            };
          }
        ];
      };
  };
}
