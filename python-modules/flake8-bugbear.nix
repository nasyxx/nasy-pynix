{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "flake8-bugbear";
  version = "21.3.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "183ca4ghb1l8mk3ic7ak9gm08z2j4c7h1hx78lxld5pgrqsf9p6a";
  };

  propagatedBuildInputs = with pypkgs; [ flake8 pytest ];
}
