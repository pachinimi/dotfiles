{
  config,
  lib,
  pkgs,
  ...
}:

{

  imports = [
    ./modules/audio.nix
    ./modules/boot.nix
    ./modules/disko.nix
    ./modules/fonts.nix
    ./modules/games.nix
    ./modules/gnome.nix
    ./modules/hardware.nix
    ./modules/network.nix
    ./modules/virtualisation.nix
  ];

  time.timeZone = "America/Sao_Paulo";

  i18n.defaultLocale = "en_US.UTF-8";

  users.users.pachi = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;

  documentation.nixos.enable = false;

  environment.defaultPackages = lib.mkForce [ ];

  programs.nano.enable = false;

  services.earlyoom.enable = true;

  zramSwap.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
