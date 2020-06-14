{pkgs ? import <nixpkgs> { inherit system; },
system ? builtins.currentSystem,
nodejs ? pkgs."nodejs-12_x",
globalBuildInputs ? []}:

let
  nodeEnv = {env} : import (env + "/node-env.nix") {
    inherit (pkgs) stdenv python2 utillinux runCommand writeTextFile;
    inherit nodejs;
    libtool = if pkgs.stdenv.isDarwin then pkgs.darwin.cctools else null;
  };
  nodeRegistry = {env} : import (env + "/registry.nix") {
    inherit (pkgs) fetchurl fetchgit;
    nodeEnv = nodeEnv {env = env;};
    globalBuildInputs = globalBuildInputs;
  };
  dev = nodeRegistry {env = ./dev;};
in
{
  dev = dev;
  shell = dev.shell;
  prod = nodeRegistry {env = ./prod;};
}
