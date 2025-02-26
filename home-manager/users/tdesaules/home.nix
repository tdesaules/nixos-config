{ config, pkgs, home-manager, currentUser, ... }:

{
  home.username = currentUser;
  home.homeDirectory = "/home/${currentUser}";
  home-manager.users.${currentUser} = {
    packages = with pkgs; [
      # Add user-specific packages here
    ];
  };
}
