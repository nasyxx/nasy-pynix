{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "flake8-isort";
  version = "4.0.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1ngl12ia178i5n1khqga77ndb8xi9s28a0f9qabb69hr9w7k149b";
  };
  checkInputs = [ pypkgs.pytest ];

  propagatedBuildInputs = with pypkgs; [ flake8 ];
}
