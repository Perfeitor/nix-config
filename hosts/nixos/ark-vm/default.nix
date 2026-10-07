{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../../profiles/base
    ../../../profiles/development
  ];

  networking.hostName = "ark-vm";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  users.users.perfeitor = {
    isNormalUser = true;
    description = "Nguyen Quang Huy";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  system.stateVersion = "26.05";
}