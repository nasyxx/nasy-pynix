{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "pdm";
  version = "1.4.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0c3ii50bf03w5ci340h3xa16lcn074fvx533dsr4m55hhwbilz8z";
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
