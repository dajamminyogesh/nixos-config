{ config, pkgs, ... }:

{
  imports = [ (import "${pkgs.home-manager}/nixos") ];
  environment.systemPackages = with pkgs; [
    home-manager
    # my packages
    jetbrains.pycharm-professional
  ];

  users.users.ysharma.isNormalUser = true;
  home-manager.users.ysharma = { pkgs, ... }: {
    home.packages = [ pkgs.atool pkgs.httpie ];
    home.shellAliases = {
      klssh="ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null";
      local_determinator="scp `dev build.determinator.determinator` determinator14: && ssh determinator14 'cd determinator && tar -xf ../*.tgz && rm -f ../*.tgz && sudo ./start_vm.sh -u $USER -d ~/determinator -v vm0 -i ~/target-uefi.iso -D 6 -m 4096 -I'";
    };
    programs.bash.enable = true;

    # The state version is required and should stay at the version you
    # originally installed.
    home.stateVersion = "24.11";
  };
}
