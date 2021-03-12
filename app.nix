{python, pkgs}:

let
  py = import (./. + "/python-modules") {
    inherit pkgs;
    python = python;
  };
  pypkgs = python.pkgs;
in
{
  pdm = pypkgs.toPythonApplication pypkgs.pdm;
}
