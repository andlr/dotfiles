{ self, inputs, ... }: {

  flake.nixosConfigurations.alThinkpad = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.core
      self.nixosModules.alThinkpadConfiguration
    ];
  };

}
