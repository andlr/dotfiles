{ self, inputs, ... }: {

  flake.nixosModules.niri = { pkgs, lib, ... }: {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
    };
  };

  perSystem = { pkgs, lib, self', ... }: {

    packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs;
      settings = {
        spawn-at-startup = [
          (lib.getExe self'.packages.myNoctalia)
        ];

	xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

        input.keyboard = {
          xkb.layout = "us,ua";
          xkb.options = "grp:shift_caps_toggle";
        };

        layout.gaps = 5;

        binds = {
	  "Mod+Shift+Slash".show-hotkey-overlay = _: { };
          "Mod+Return".spawn-sh = lib.getExe pkgs.kitty;
          "Mod+X".spawn-sh = "${lib.getExe self'.packages.myNoctalia} ipc call launcher toggle";
        };
      };
    };

  };

}
