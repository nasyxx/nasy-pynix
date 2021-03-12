{ pkgs ? import <nixpkgs> { }
, python ? "python3"
}:

let
  _python = pkgs."${python}";
  _pypkgs = import (./. + "/python-modules") {
    inherit pkgs;
    python = _python;
  };
in
rec {
  inherit pkgs;
  python = _python;
  pypkgs = python.pkgs // _pypkgs;
  apps = {py ? _python}:
    import ./app.nix { inherit pkgs; python = py;};
  withPackages = python.withPackages;
}
