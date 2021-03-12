{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "flake8-string-format";
  version = "0.3.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "18pagn8whj1kf9lm1qzjfz1m6a6v9qqhny53zivyyq8ld9wdmwv5";
  };

  doCheck = false;
  propagatedBuildInputs = with pypkgs; [ flake8 ];
}
