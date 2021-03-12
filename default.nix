{ pkgs ? import <nixpkgs> { }
, python ? "python3"
, overridePythonPackage ? false
, ...
}:

let
  py = pkgs."${python}";
  _pypkgs = import (./. + "/python-modules") {
    inherit pkgs;
    python = py;
  };
in
rec {
  inherit pkgs;
  python =
    if overridePythonPackage
    then py.override { packageOverrides = n: o: _pypkgs; self = python; }
    else py;
  pypkgs =
    if overridePythonPackage
    then python.pkgs
    else _pypkgs;
  apps = import ./app.nix { inherit pypkgs; };
  withPackages = python.withPackages;
}
