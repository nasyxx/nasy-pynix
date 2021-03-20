{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "flake8-comprehensions";
  version = "3.4.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "19qwqcx0zi4c487bkk2k2yzmk640zvq28c6sk1ma4n9rkyz3j060";
  };

  propagatedBuildInputs = with pypkgs; [ flake8 ];
}
