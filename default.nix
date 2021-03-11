{ pkgs ? import <nixpkgs> { }
, python ? "python3"
, ...
}:
let
  py = pkgs."${python}";
in
(
  let
    packageOverrides = n: o: import (./. + "/python-modules") {
      inherit pkgs;
      python = py;
    };
    python = py.override { inherit packageOverrides; self = py; };
    pypkgs = python.pkgs;
  in
  rec {
    inherit python;
    pkgs = pypkgs;
    apps = import ./app.nix { inherit pypkgs; };
  }
)
