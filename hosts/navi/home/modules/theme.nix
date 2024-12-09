{ pkgs, ... }:

{

  home.packages = with pkgs; [
    adw-gtk3
    qadwaitadecorations
    qadwaitadecorations-qt6
  ];

  gtk.theme = {
    enable = true;
    package = pkgs.adw-gtk3;
    name = "adw-gtk3-dark";
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = "adw-gtk3-dark";
    };
  };

}
