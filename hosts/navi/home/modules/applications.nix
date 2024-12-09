{ pkgs, ... }:

{

  home.packages = with pkgs; [
    # Audio
    audacity
    furnace
    reaper
    renoise

    # Communications
    flare-signal
    fractal
    polari
    vesktop

    # Filesharing
    nicotine-plus
    qbittorrent

    # Graphics
    aseprite
    blender
    krita

    # Internet
    amfora
    firefox
    lynx
    tuba
    ungoogled-chromium

    # Productivity
    anki
    gnome-clocks

    # Security
    bitwarden
    ente-auth
    gnome-secrets
    steamguard-cli

    # Utilities
    addwater
    adwsteamgtk
    file-roller
    menulibre
    wl-clipboard

    # Video
    obs-studio
    davinci-resolve
  ];

}
