{
  description = "A Nix Flake for dynamic hostname generation";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    hostname = import ./hostname.nix {
      inherit nixpkgs;
    };
  };
}
