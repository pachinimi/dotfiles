{ pkgs, lib, ... }:

{

  boot.loader.grub = {
    enable = true;
    device = /dev/sda;
  };

}
