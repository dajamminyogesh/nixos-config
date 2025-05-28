{ config, pkgs, ... }:

{
  imports = [ 
    ./hacks.nix
#    ./home.nix
    ./hyprland.nix
    ./starship.nix
  ];
}
