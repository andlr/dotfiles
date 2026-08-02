# modules/features/core.nix
{ inputs, ... }:

{
  flake.nixosModules.core =
    { pkgs, ... }:
    {
      imports = [
        inputs.noctalia-greeter.nixosModules.default
      ];

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

      programs.noctalia-greeter = {
        enable = true;

        greeter-args = "";
        settings = {
          cursor = {
            theme = "Bibata-Modern-Ice";
            size = 24;
            path = "${pkgs.bibata-cursors}/share/icons";
          };
          keyboard = {
            layout = "us";
          };
        };
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
        devenv
        vscode
        slack
        dnsutils
        ghostty
      ];

      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      nixpkgs.config.allowUnfree = true;
    };
}
