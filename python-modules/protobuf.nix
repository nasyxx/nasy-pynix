{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "protobuf";
  version = "3.15.5";

  src = fetchPypi {
    inherit pname version;
    sha256 = "15v0zcgfvw48794shn77kaind2d05zk8p19cksz6rfvqc6f952my";
  };



  doCheck = false;
}
