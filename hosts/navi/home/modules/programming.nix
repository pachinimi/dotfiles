{ pkgs, ... }:

{

  home.packages = with pkgs; [
    editorconfig-core-c
    ghidra
    godot_4
    ispell
    nodePackages.js-beautify
    python312Packages.grip
    rust-analyzer
    shfmt
    shellcheck
    stylelint
    html-tidy
  ];

  programs.git = {
    enable = true;
    userName = "pachi";
    userEmail = "pachinimi@gmail.com";
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };

  programs.emacs.enable = true;
  home.file.".config/doom".source = ./config/doom;

  programs.neovim.enable = true;
  home.file.".config/nvim/lua".source = ./config/nvim/lua;
  home.file.".config/nvim/init.lua".source = ./config/nvim/init.lua;

}
