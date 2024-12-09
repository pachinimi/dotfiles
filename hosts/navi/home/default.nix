{ config, pkgs, ... }:

{
  imports = [
    ./modules/applications.nix
    ./modules/command-line.nix
    ./modules/games.nix
    ./modules/multimedia.nix
    ./modules/programming.nix
    ./modules/theme.nix
    ./modules/xdg.nix
  ];

  home.username = "pachi";
  home.homeDirectory = "/home/pachi";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
