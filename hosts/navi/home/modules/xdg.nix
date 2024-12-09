{ ... }:
{

  xdg = {
    cacheHome = /home/pachi/.cache;
    configHome = /home/pachi/.config;
    dataHome = /home/pachi/.local/share;
    stateHome = /home/pachi/.local/state;
    userDirs = {
      enable = true;
      createDirectories = true;
      desktop = /home/pachi/Storage/Desktop;
      documents = /home/pachi/Storage/Documents;
      download = /home/pachi/Storage/Downloads;
      music = /home/pachi/Storage/Media/Music;
      pictures = /home/pachi/Storage/Media/Pictures;
      publicShare = /home/pachi/Storage/Public;
      templates = /home/pachi/Storage/Templates;
      videos = /home/pachi/Storage/Media/Videos;
    };
  };

}
