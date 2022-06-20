- `polysemy-zoo` is a Haskell lib, originally defined in `nixpkgs`, overriden in `./overlay.nix`

  `nix build .#polysemy-zoo` fails at compile time (that's fine)

- `servant-polysemy` depends on `polysemy-zoo`

  `nix build .#servant-polysemy` fails at EVALUATION time with

  ```
  error: Package ‘polysemy-zoo-0.8.0.0’ in /nix/store/di36mqc6y19ivaa4qjrb2l82c6dqg7m3-source/pkgs/development/haskell-modules/hackage-packages.nix:216204 is marked as broken, refusing to evaluate.
  ```
