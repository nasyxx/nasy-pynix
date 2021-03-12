{ pkgs, python, ... }:

let
  packages = (self:
    let
      inherit (builtins) attrNames readDir map filter listToAttrs replaceStrings;
      inherit (pkgs.lib) hasPrefix hasSuffix;

      fpCheck = x: !(hasPrefix "." x) && x != "default.nix" && hasSuffix ".nix" x;
      rs = s: replaceStrings [ ".nix" ] [ "" ] s;
      pypkgs = python.pkgs // self;
      callPackage = pkgs.newScope (pkgs // pypkgs);
    in
    {
      inherit pypkgs;
    }
    //
    listToAttrs
      (map
        (name: {
          name = rs name;
          value = callPackage (./. + "/${name}") { };
        })
        (filter fpCheck (attrNames (readDir ./.))))
  );
in
pkgs.lib.fix packages
