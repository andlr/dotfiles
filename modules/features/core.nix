# modules/features/core.nix
{ inputs, ... }:

{
  flake.nixosModules.core =
    { pkgs, ... }:
    {
      services.resolved.enable = true;

      networking.networkmanager = {
        enable = true;

        plugins = with pkgs; [
          networkmanager-openvpn
        ];

        dns = "systemd-resolved";
      };

      programs.nm-applet.enable = true;
      services.gnome.gnome-keyring.enable = true;

      time.timeZone = "Europe/Kyiv";

      programs.zsh.enable = true;
      users.defaultUserShell = pkgs.zsh;

      users.users.al = {
        isNormalUser = true;

        extraGroups = [
          "networkmanager"
          "wheel"
        ];

        packages = with pkgs; [
          tree
        ];
      };

      programs.firefox.enable = true;

      programs.regreet.enable = true;

      environment.systemPackages = with pkgs; [
        vim
        neovim
        wget
        git
        vivaldi
        stow
        tmux
        curl
        devenv
        vscode
        slack
        dnsutils
      ];

      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      nixpkgs.config.allowUnfree = true;
    };
}
