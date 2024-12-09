{ pkgs, ... }:

{

  home.packages = with pkgs; [
    bottles
    cartridges
    cemu
    dolphin-emu
    gzdoom
    heroic
    ioquake3
    mangohud
    pcsx2
    ppsspp
    prismlauncher
    protonplus
    ringracers
    rpcs3
    ryujinx
    vkquake
    srb2
    xemu
    yquake2
  ];

}
