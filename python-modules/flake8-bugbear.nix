{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "flake8-bugbear";
  version = "21.4.3";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1rspvirl02l6vj3w45jpw2fkswny13avg3in9agb6mcri0gwhii3";
  };
  doCheck = false;
  propagatedBuildInputs = with pypkgs; [ attrs flake8 ];
}
