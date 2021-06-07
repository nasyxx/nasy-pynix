{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "pdm";
  version = "1.6.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1lpwb55fg8yrhw8gqg6gg5rr1a49gb3j5vrdf6lmh11394zs80z4";
  };

  format = "pyproject";

  propagatedBuildInputs = with pypkgs; [
      appdirs
      click
      distlib
      halo
      pep517
      pdm-pep517
      pip
      pip_shims
      pycomplete
      python-cfonts
      pythonfinder
      python-dotenv
      resolvelib
      shellingham
      tomlkit
      wheel
      keyring
    ];
}
