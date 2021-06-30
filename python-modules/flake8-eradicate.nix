{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "flake8-eradicate";
  version = "1.1.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1a3hy40r3lr5if4lg3badzrg0j2wqnwxlpy1236yylm3pinpv4gm";
  };

  propagatedBuildInputs = with pypkgs; [ flake8 eradicate attrs ];
}
