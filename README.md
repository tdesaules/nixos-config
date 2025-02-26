# nixos-config

## Configure Hostname

### use dmidecode to get the system-uuid

```bash
dmidecode -s system-uuid
```

### configure hostname in /etc/nixos/configuration.nix

```nix
networking.hostName = "host-1c79a46e-73a7-7849-a6e3-82d1da5bca2a";
```

### rebuild nixos

```bash
sudo nixos-rebuild switch
```

## Unstable Channel

### switch to the unstable channel and upgrade

```bash
sudo nix-channel --list
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
sudo nixos-rebuild switch --upgrade
```

### in case of corruption

```bash
sudo nix-collect-garbage
sudo nix-store --verify --check-contents
sudo nix store repair --all
sudo nixos-rebuild switch --upgrade
```

```bash
sudo nixos-rebuild switch --flake ~/nixos-config --impure
```