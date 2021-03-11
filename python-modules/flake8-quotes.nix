{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "flake8-quotes";
  version = "3.2.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0ph5s6lxgpzz4an0ax6s5xjqypqmngwr5b1i0h9pqhzghplic49z";
  };
  checkInputs = [ pypkgs.pytest ];

  propagatedBuildInputs = with pypkgs; [ flake8 ];
}
