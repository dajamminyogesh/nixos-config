{ config, pkgs, ... }:

{
  fonts.packages = with pkgs; [ nerdfonts ];

  programs.starship = {
    enable = true;
    settings = {
      format = ''[░▒▓](#a3aed2)[ [{](bg:#a3aed2 fg:purple)[󰃤](bg:#a3aed2 fg:purple)[}](bg:#a3aed2 fg:purple) ](bg:#a3aed2 fg:#090c0c)[](bg:#769ff0 fg:#a3aed2)$directory[](fg:#769ff0 bg:#394260)$hg_branch[ ](fg:#394260)
        $character'';
      hg_branch={
        disabled=false;
        style ="fg:#769ff0 bg:#394260";
        format = "[[ $symbol$branch ](fg:#769ff0 bg:#394260)]($style)";

      };
      directory={
        style="fg:#e3e5e5 bg:#769ff0";
        format="[ $path ]($style)";
        truncation_length=3;
        truncation_symbol="…/";
        home_symbol="";
        substitutions={
          "src/star"="󱝁 ";
        };
      };

      character={
        format="[❯ ](bold purple)";
      };
      time={
        disabled=true;
      };

    };
  };

}
