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
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  environment.systemPackages = with pkgs; [
    # Add other specific packages here
  ];
}
