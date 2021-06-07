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


  python =
    let
      python = _python.override {
        self = python;
        packageOverrides = (n: o:
          _pypkgs python
          // ignoreCheckList o ignoreChecks
          // packageOverrides n python
          // { pkgs = pkgs // { stdenv = _stdenv; }; }
          // {
            poetry = o.poetry.overridePythonAttrs (old: {
              propagatedBuildInputs = old.propagatedBuildInputs ++ [ o.packaging ];
              doInstallCheck = false;
              doCheck = false;
              checkInputs = [ ];
              installCheckPhase = "";
            });
            jedi = n.njedi;
            black = n.nblack;
            scipy = o.scipy.overridePythonAttrs (old: {
              format = "wheel";
              doCheck = false;
              prePatch = "";
              preConfigure = "";
              preBuild = "";
              checkPhase = "";
              src = o.fetchPypi {
                inherit (old) pname version;
                format = "wheel";
                sha256 = "sha256-DIpR0zVWv3A2dFLU1gHRdCwOgGzQGUeFkU2vGXdfDmc=";
                platform = "macosx_10_9_x86_64";
                python = "cp39";
                abi = "cp39";
              };
            });
            mypy = o.mypy.overridePythonAttrs (old: {
              format = "wheel";
              src = o.fetchPypi {
                inherit (old) pname version;
                format = "wheel";
                platform = "macosx_10_9_x86_64";
                python = "cp39";
                abi = "cp39";
                sha256 = "sha256-fOMXWAHQrl/fp5tPDP7QiAevTQdbQCt+KU5qpyr5qio=";
              };
            });
          }
        );
        stdenv = _stdenv;
      };
    in
    python;
  apps = { py ? python }:
    import ./app.nix { inherit pkgs; python = py; };
}
