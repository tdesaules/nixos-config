{
  description = "NixOS configurations for my devices";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    hostname.url = "path:./modules/hostname";
  };

  outputs = { self, nixpkgs, home-manager, hostname, ... }:
    let
      system = builtins.currentSystem;
      currentHostName = builtins.getEnv "HOSTNAME";
    in
    {
      nixosConfigurations = {
        "${currentHostName}" = import ./hosts/${currentHostName} {
          inherit nixpkgs home-manager hostname;
        };
      };
    };
}
