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
    checkPhase = "";
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
            checkPhase = "";
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
          checkPhase = "";
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
            black = n.nblack;

            jedi = n.njedi;

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

            kiwisolver = o.kiwisolver.overridePythonAttrs (old: {
              format = "wheel";
              doCheck = false;
              prePatch = "";
              preConfigure = "";
              preBuild = "";
              checkPhase = "";
              src = builtins.fetchurl {
                url = "https://files.pythonhosted.org/packages/cp39/k/kiwisolver/kiwisolver-${old.version}-cp39-cp39-macosx_10_9_x86_64.whl";
                sha256 = "sha256:003hparz24hy30cjalhyqg9hg4n5zplsssf1sghxx8dj6qd6ibsh";
              };
            });

            poetry = o.poetry.overridePythonAttrs (old: {
              propagatedBuildInputs = old.propagatedBuildInputs ++ [ o.packaging ];
              doInstallCheck = false;
              doCheck = false;
              checkInputs = [ ];
              installCheckPhase = "";
            });

            pytest-mock = o.pytest-mock.overridePythonAttrs (old: {
              propagatedBuildInputs = [ o.pytest ];
              doInstallCheck = false;
              doCheck = false;
              checkInputs = [ ];
              installCheckPhase = "";
            });

            scipy = o.scipy.overridePythonAttrs (old: {
              format = "wheel";
              doCheck = false;
              prePatch = "";
              preConfigure = "";
              preBuild = "";
              checkPhase = "";
              src = builtins.fetchurl {
                url = "https://files.pythonhosted.org/packages/cp39/s/scipy/scipy-${old.version}-cp39-cp39-macosx_10_9_x86_64.whl";
                sha256 = "sha256:04yclg6xdq5i06vsfy3zhimjnwmvpsgx2ak92b3b8rh3hc7d8jfl";
              };
              # src = o.fetchPypi {
              #   inherit (old) pname version;
              #   format = "wheel";
              #   sha256 = "sha256-DIpR0zVWv3A2dFLU1gHRdCwOgGzQGUeFkU2vGXdfDmc=";
              #   platform = "macosx_10_9_x86_64";
              #   python = "cp39";
              #   abi = "cp39";
              # };
            });

            uvloop = o.uvloop.overridePythonAttrs (old: {
              format = "wheel";
              doCheck = false;
              prePatch = "";
              preConfigure = "";
              preBuild = "";
              checkPhase = "";
              src = o.fetchPypi {
                inherit (old) pname version;
                format = "wheel";
                sha256 = "sha256-EUVDyE6V3xtP9Ubm46J1IVgEZqMBJ/EhcqMngXKtaLw";
                platform = "macosx_10_14_x86_64";
                python = "cp39";
                abi = "cp39";
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
