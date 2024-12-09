{
  config,
  pkgs,
  inputs,
  ...
}:

{
  home.packages = with pkgs; [
    celluloid
    foliate
    gapless
    komikku
    loupe
    papers
    picard
    youtube-music
  ];

  programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        adblock
        shuffle
      ];
      theme = spicePkgs.themes.defaultDynamic;
    };

}
