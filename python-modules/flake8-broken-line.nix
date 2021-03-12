{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "flake8-broken-line";
  version = "0.3.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0l0bn5q7x5rg3hj2cnpypam3zcjlriy2y0sm01grwjij6cl0akpp";
  };

  propagatedBuildInputs = with pypkgs; [ flake8 ];
}
