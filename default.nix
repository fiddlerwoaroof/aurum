{pkgs ? import <nixpkgs> {
  inherit system;
},
system ? builtins.currentSystem,
nodejs ? pkgs."nodejs-12_x"
 }:

let
  buildInputs =  [pkgs.dhall pkgs.dhall-json];
  it = import ./project.nix {
    inherit pkgs system nodejs;
    globalBuildInputs = buildInputs;
  };
in it.dev
