{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "flake8-comprehensions";
  version = "3.3.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "08mxz6560yvs01z7vdjiqaask8b57b93bxlvdn465dbbh01vyd77";
  };

  propagatedBuildInputs = with pypkgs; [ flake8 pytest ];
}
