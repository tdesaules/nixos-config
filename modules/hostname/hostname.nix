{ config, pkgs, ... }:

let
  dmidecode = pkgs.dmidecode;
in
{
  environment.systemPackages = with pkgs; [ dmidecode ];
  systemUuid = pkgs.lib.strings.trim (pkgs.runCommand "getSystemUuid" {
    buildInputs = [ dmidecode ];
  } ''
    ${dmidecode}/bin/dmidecode -s system-uuid
  '');
  networking.hostName = "host-${systemUuid}";
}
