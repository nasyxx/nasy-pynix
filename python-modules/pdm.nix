{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "pdm";
  version = "1.5.3";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0j4mq9d6ygqcdcr444f4jr4xxsc8xpi818yacsd3can3ni6wkd24";
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
