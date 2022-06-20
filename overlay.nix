inputs:
ghcVersion:
final: prev:
let haskell = final.haskell.packages.${ghcVersion};
 in
{
  haskell = prev.haskell // {
    packages = prev.haskell.packages // {
      "${ghcVersion}" = with haskell; prev.haskell.packages.${ghcVersion} // {
        polysemy-zoo = mkDerivation {
          pname = "polysemy-zoo";
          version = "0.8.0.0";
          src = inputs.polysemy-zoo-src;
          libraryHaskellDepends = [
            async
            base
            compact
            constraints
            containers
            contravariant
            exceptions
            ghc
            mtl
            polysemy
            random
            reflection
            streaming
            text
            transformers
          ];
          doCheck = false;
          doHaddock = false;
          description = "Experimental, user-contributed effects and interpreters for polysemy";
          license = final.lib.licenses.bsd3;
        };
      };
    };
  };
}
