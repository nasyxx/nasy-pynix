{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "pdm";
  version = "1.6.4";

  src = fetchPypi {
    inherit pname version;
    sha256 = "16f9fy6lr1qcd6w8aa1wbqghil055xjz8g0wzl8ki8wgp8zvafkc";
  };

  format = "pyproject";

  propagatedBuildInputs = with pypkgs; [
    appdirs
    atoml
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
    setuptools
    shellingham
    tomlkit
    wheel
    keyring
  ];
}
