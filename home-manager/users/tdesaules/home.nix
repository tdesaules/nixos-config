{ config, pkgs, ... }:

let
  username = "thibault";
  userEmail = "thibault@desaules.me";
in
{
  nixpkgs.config.allowUnfree = true;
  home = {
    stateVersion = "24.11";
    username = "${username}";
    homeDirectory = "/home/${username}";
    packages = with pkgs; [
      fish
      starship
      fastfetch
      lazygit
      vscode
    ];
  };
  programs = {
    home-manager.enable = true;
    bash.shellAliases = {
      lzg = "lazygit";
    };
    git = {
      enable = true;
      userName = "${username}";
      userEmail = "${userEmail}";
    };
  };
}
