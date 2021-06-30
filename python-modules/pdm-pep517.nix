{ buildPythonPackage, fetchPypi }:

buildPythonPackage rec {
  pname = "pdm-pep517";
  version = "0.8.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1igp3zvsnql71pn8lg02rszw5w16pnsblzh7b3n3kprrps5dxz7i";
  };

  format = "pyproject";
}
