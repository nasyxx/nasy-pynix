{ python, pkgs }:

let
  py = import (./. + "/python-modules") {
    inherit pkgs;
    python = python;
  };
  pypkgs = python.pkgs;
  toApp = n: pypkgs.toPythonApplication pypkgs.${n};
  toApps = apps: builtins.listToAttrs (map (app: { name = app; value = toApp app; }) apps);
in
toApps [
  "black"
  "pdm"
  "isort"
] //
{ }
