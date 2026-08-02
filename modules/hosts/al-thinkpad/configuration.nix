{ self, inputs, ... }: {

  flake.nixosModules.alThinkpadConfiguration =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      imports = [
        self.nixosModules.alThinkpadHardware
        self.nixosModules.niri
      ];

      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;
      boot.kernelPackages = pkgs.linuxPackages_latest;

      networking.hostName = "al-thinkpad";

      system.stateVersion = "26.05";
    };

}
