{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "pdm";
  version = "1.4.5";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0zia47mywjf0w3cj3cl2hm8gcdhrmcsx5dplpgn9mj19dvqrnggy";
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
