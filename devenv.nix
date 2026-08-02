{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  packages = [
    pkgs.nixfmt
    pkgs.treefmt
    pkgs.shellcheck
    pkgs.shfmt
  ];

  git-hooks.hooks = {
    treefmt.enable = true;
  };
}
