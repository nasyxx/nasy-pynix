{ pkgs, python, overrides ? (self: super: { }), ... }:

let
  packages = (self:
    let
      callPackage = pkgs.newScope (pkgs // python.pkgs // self);
      inherit (builtins) attrNames readDir map filter listToAttrs replaceStrings;
      inherit (pkgs.lib) hasPrefix hasSuffix;
      fpCheck = x: !(hasPrefix "." x) && x != "default.nix" && hasSuffix ".nix" x;
      rs = s: replaceStrings [ ".nix" ] [ "" ] s;
      pypkgs = python.pkgs // self;
    in
    {
      inherit pypkgs;
    }
    // listToAttrs
      (map
        (name: {
          name = rs name;
          value = callPackage (./. + "/${name}") { };
        })
        (filter fpCheck (attrNames (readDir ./.))))
  );
in
pkgs.lib.fix' (pkgs.lib.extends overrides packages)
