let pkgs = import <nixpkgs> {};
in pkgs.nixBufferBuilders.withPackages [ pkgs.dhall pkgs.dhall-json pkgs.nixfmt ]
