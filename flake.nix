{
  description = "NixOS configurations for my devices";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    currentHostName = builtins.elemAt (builtins.split "\n" (builtins.readFile /etc/hostname)) 0;
    currentUsername = builtins.getEnv "USER";
    system = builtins.currentSystem;
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    nixosConfigurations."${currentHostName}" = nixpkgs.lib.nixosSystem
    {
      modules = [
        (import ./hosts/${currentHostName}/configuration.nix
        {
          inherit pkgs currentUsername;
        })
      ];
    };
    homeConfigurations."${currentUsername}" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        ./home-manager/users/${currentUsername}/home.nix
      ];
    };
  };
}
