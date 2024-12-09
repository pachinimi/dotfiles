{ pkgs, ... }:

{

  home.packages = with pkgs; [
    fastfetch
    fd
    ripgrep
    nixfmt-rfc-style
    nnn
    rclone
    vt-cli
    yt-dlp
  ];

  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      export PATH="$PATH:$HOME/.config/emacs/bin"
    '';
    shellAliases = {
    };
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
    };
  };

  programs.htop.enable = true;

  programs.bat = {
    enable = true;
    config = {
      theme = "base16";
    };
  };

  programs.lsd = {
    enable = true;
    enableAliases = true;
  };

}
