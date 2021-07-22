{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "pdm";
  version = "1.7.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "11ylf42d8415myisgl6xsq3287n2rp6lc12x7i8n58i4f4gdarlh";
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

  patchPhase = ''
    sed -i 's/pdm-pep517<0.8.0,>=0.7.0/pdm-pep517/g' pyproject.toml
  '';
}
