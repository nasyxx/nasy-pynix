{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "flake8-rst-docstrings";
  version = "0.0.14";

  src = fetchPypi {
    inherit pname version;
    sha256 = "18l206kwm52bhzzzcjqxj7v2hqdc7sprjb5sv1nm12s0y4ccp2wg";
  };

  patchPhase = ''
  sed -i "s/yield definition.start + rst_error.line, 0, msg, type(self)/yield definition.start + (rst_error.line or 0), 0, msg, type(self)/g" flake8_rst_docstrings.py
  '';

  propagatedBuildInputs = with pypkgs; [ flake8 restructuredtext_lint ];
}
