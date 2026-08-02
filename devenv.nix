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
  ];

  git-hooks.hooks = {
    shellcheck.enable = true;
    treefmt.enable = true;
  };
}
