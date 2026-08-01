{ self, inputs, ... }: {

  flake.nixosModules.alThinkpadConfiguration = { config, lib, pkgs, ... }: {
    imports =
      [
        self.nixosModules.alThinkpadHardware
        self.nixosModules.niri
      ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.kernelPackages = pkgs.linuxPackages_latest;

    networking.hostName = "al-thinkpad";
    networking.networkmanager.enable = true;

    time.timeZone = "Europe/Kyiv";

    programs.zsh.enable = true;
    users.defaultUserShell = pkgs.zsh;

    users.users.al = {
      isNormalUser = true;
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
        tree
      ];
    };

    programs.firefox.enable = true;

    programs.regreet = {
      enable = true;
      # For this example you'd need to have a version of Adwaita and the font Cantarell installed
      #theme.name = "Adwaita"; 
      #font = {
      #  name = "Cantarell";
      #  size = 16;
      #};
      #cursorTheme.name = "Adwaita";
    };

    environment.systemPackages = with pkgs; [
      vim
      neovim
      wget
      git
      vivaldi
      stow
      tmux
      curl
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nixpkgs.config.allowUnfree = true;

    system.stateVersion = "26.05";
  };

}

