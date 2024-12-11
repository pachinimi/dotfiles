{
  description = "My personal flake";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      disko,
      lanzaboote,
      spicetify-nix,
      ...
    }:
    {
      nixosConfigurations = {
        navi = inputs.nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/navi/system
            lanzaboote.nixosModules.lanzaboote
            disko.nixosModules.disko
            {
              disko.devices = {
                disk = {
                  main = {
                    type = "disk";
                    device = "/dev/vdb";
                    content = {
                      type = "gpt";
                      partitions = {
                        ESP = {
                          size = "512M";
                          type = "EF00";
                          content = {
                            type = "filesystem";
                            format = "vfat";
                            mountpoint = "/boot";
                            mountOptions = [ "umask=0077" ];
                          };
                        };
                        luks = {
                          size = "100%";
                          content = {
                            type = "luks";
                            name = "crypted";
                            settings = {
                              allowDiscards = true;
                            };
                            content = {
                              type = "btrfs";
                              extraArgs = [ "-f" ];
                              subvolumes = {
                                "/root" = {
                                  mountpoint = "/";
                                  mountOptions = [
                                    "compress-force=zstd"
                                    "noatime"
                                  ];
                                };
                                "/home" = {
                                  mountpoint = "/home";
                                  mountOptions = [
                                    "compress-force=zstd"
                                    "noatime"
                                  ];
                                };
                                "/nix" = {
                                  mountpoint = "/nix";
                                  mountOptions = [
                                    "compress-force=zstd"
                                    "noatime"
                                  ];
                                };
                                "/swap" = {
                                  mountpoint = "/.swapvol";
                                  swap.swapfile.size = "20M";
                                };
                              };
                            };
                          };
                        };
                      };
                    };
                  };
                };
              };
            }
            home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = { inherit inputs; };
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "hmbkp";
              home-manager.users.pachi.imports = [
                ./hosts/navi/home
                inputs.spicetify-nix.homeManagerModules.default
              ];
            }
          ];
        };
        gaia = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/gaia/system
            disko.nixosModules.disko
            {
              disk = {
                main = {
                  content = {
                    type = "gpt";
                    partitions = {
                      grub = {
                        size = "1M";
                        type = "EF02";
                      };
                      boot = {
                        size = "512M";
                        content = {
                          type = "filesystem";
                          format = "vfat";
                          mountpoint = "/boot";
                        };
                      };
                      luks = {
                        size = "100%";
                        content = {
                          type = "luks";
                          name = "crypted";
                          settings = {
                            allowDiscards = true;
                          };
                          content = {
                            type = "btrfs";
                            extraArgs = [ "-f" ];
                            subvolumes = {
                              "/root" = {
                                mountpoint = "/";
                                mountOptions = [
                                  "compress-force=zstd"
                                  "noatime"
                                ];
                              };
                              "/home" = {
                                mountpoint = "/home";
                                mountOptions = [
                                  "compress-force=zstd"
                                  "noatime"
                                ];
                              };
                              "/nix" = {
                                mountpoint = "/nix";
                                mountOptions = [
                                  "compress-force=zstd"
                                  "noatime"
                                ];
                              };
                              "/swap" = {
                                mountpoint = "/.swapvol";
                                swap.swapfile.size = "20M";
                              };
                            };
                          };
                        };
                      };
                    };
                  };
                };
              };
            }
          ];
        };
      };

    };
}
