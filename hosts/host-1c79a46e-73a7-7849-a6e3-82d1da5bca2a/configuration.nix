{ config, pkgs, hostname, home-manager, ... }:

let
  hardwareConfig = import ./hardware-configuration.nix;
  homeManagerConfig = import ../../home-manager/home-manager.nix;
in
{
  imports = [
    hardwareConfig
    hostname.hostname
    homeManagerConfig
  ];
  environment.systemPackages = with pkgs; [
    # Add other specific packages here
  ];
}
