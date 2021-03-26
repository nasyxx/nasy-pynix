{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "pdm";
  version = "1.4.3";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0iwcd64asihavpf0ziii8lsqa3idgc93221im8wyx6hn31m13kyl";
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
