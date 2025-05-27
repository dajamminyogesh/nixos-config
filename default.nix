{ config, pkgs, ... }:

{
  imports = [ 
    ./hacks.nix
    ./home-manager.nix
    ./hyprland.nix
    ./starship.nix
  ];
}
