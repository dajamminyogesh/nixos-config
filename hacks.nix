{ config, pkgs, ... }:

{
  boot.kernel.sysctl = {
    "fs.inotify.max_user_watches" = 1048576;
  };
  # hardware.nvidia.nvidiaSettings = false;
  nixpkgs.config.permittedInsecurePackages = [
    "electron-32.3.3"
  ];
  nixpkgs.overlays = [(final: prev: {
    vscode-extensions = prev.vscode-extensions // {
      ms-python = prev.vscode-extensions.ms-python // {
        python = prev.vscode-extensions.ms-python.python.overrideAttrs (old: {
          src = prev.vscode-utils.fetchVsixFromVscodeMarketplace {
            name = "python";
            publisher = "ms-python";
            version = "2025.2.0";
            hash = "sha256-f573A/7s8jVfH1f3ZYZSTftrfBs6iyMWewhorX4Z0Nc=";
          };
        });
      };
    };
  })];
}
