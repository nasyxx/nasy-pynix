{ python, pkgs }:

let
  pypkgs = python.pkgs;
  toApp = n: pypkgs.toPythonApplication pypkgs.${n};
  toApps = apps: builtins.listToAttrs (map (app: { name = app; value = toApp app; }) apps);
in
toApps [
  "black"
  "isort"
  "mypy"
  "nvchecker"
  "pdm"
] //
{ }
