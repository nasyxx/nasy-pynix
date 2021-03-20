{ pkgs ? import <nixpkgs> { }
, python ? "python3"
, latest_stdenv ? true
, packageOverrides ? (n: o: { })
, ignoreChecks ? [ ]
}:

let
  _stdenv = if latest_stdenv then pkgs.llvmPackages_latest.stdenv else pkgs.stdenv;
  _python = pkgs."${python}".override {
    self = _python;
    stdenv = _stdenv;
  };
  _pypkgs = py: import (./. + "/python-modules") {
    inherit pkgs;
    python = py;
  };

  ignoreCheck = p: p.overridePythonAttrs (_: {
    doInstallCheck = false;
    doCheck = false;
    checkInputs = [ ];
    installCheckPhase = "";
  });

  ignoreCheckSet = pyp: ps:
    builtins.mapAttrs
      (p: override:
        pyp.${p}.overridePythonAttrs (_:
          override // {
            doInstallCheck = false;
            doCheck = false;
            checkInputs = [ ];
            installCheckPhase = "";
          }))
      ps;

  ignoreCheckList = pyp: ps:
    ignoreCheckSet pyp (builtins.listToAttrs (builtins.map
      (p: {
        name = p;
        value = {
          doInstallCheck = false;
          doCheck = false;
          checkInputs = [ ];
          installCheckPhase = "";
        };
      })
      ps));


in
rec {
  inherit ignoreCheck ignoreCheckSet ignoreCheckList;
  inherit pkgs;
  inherit _python;


  python = _python.override {
    self = python;
    packageOverrides = (n: o: _pypkgs python // ignoreCheckList o ignoreChecks // packageOverrides n python);
    stdenv = _stdenv;
  };

  apps = { py ? python }:
    import ./app.nix { inherit pkgs; python = py; };
}
