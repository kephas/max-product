{ pkgs ? import (fetchTarball https://github.com/NixOS/nixpkgs/archive/refs/tags/25.05.tar.gz) {} }:

pkgs.mkShell {
  packages = [pkgs.haskell-language-server (pkgs.haskellPackages.ghcWithPackages (p: [p.criterion p.hspec p.QuickCheck p.random p.string-interpolate])) ];
}
