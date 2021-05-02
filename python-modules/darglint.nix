{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "darglint";
  version = "1.8.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1j5fvkcgcm1w1z6aak7ad0bn5azdcq23jaykjx3x39hpg3s5wq5a";
  };

  doCheck = false;

}
