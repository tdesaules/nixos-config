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
    in
    {
      nixosConfigurations = {
        "${builtins.currentHostName}" = import ./hosts/${builtins.currentHostName} {
          inherit nixpkgs home-manager hostname;
        };
      };
    };
}
