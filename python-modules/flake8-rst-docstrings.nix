{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "flake8-rst-docstrings";
  version = "0.0.14";

  src = fetchPypi {
    inherit pname version;
    sha256 = "18l206kwm52bhzzzcjqxj7v2hqdc7sprjb5sv1nm12s0y4ccp2wg";
  };

  checkInputs = [ pypkgs.pytest ];

  propagatedBuildInputs = with pypkgs; [ flake8 ];
}
