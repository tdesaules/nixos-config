{ config, pkgs, home-manager, ... }:

let
  currentUser = builtins.getEnv "USER";
  userHomeConfig = import ./users/${currentUser}/home.nix {
    inherit currentUser;
  };
in
{
  programs.home-manager.enable = true;
  home-manager.users.defaults = {
    packages = with pkgs; [
      # Add other default packages here
    ];
  };
  home-manager.users.${currentUser} = userHomeConfig.home-manager.users.${currentUser};
}
