{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/22.05;
    utils.url = github:numtide/flake-utils;

    polysemy-zoo-src = {
      url = github:polysemy-research/polysemy-zoo/006421384e61f4a7f66670e69af926735c91a65e;
      flake = false;
    };
  };

  outputs = inputs@{ nixpkgs, utils, ... }:
    utils.lib.eachDefaultSystem (system:
      let ghcVersion = "ghc922";
          pkgs = import nixpkgs {
            inherit system;
            overlays = [ (import ./overlay.nix inputs ghcVersion) ];
          };
       in
      {
        packages = pkgs.haskell.packages.${ghcVersion};
      });
}
