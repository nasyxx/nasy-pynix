{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "protobuf";
  version = "3.15.8";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1l0i1g2ljxbz59057mfbh7d4hcsm3n664wcswyphq8a23qmzcxq2";
  };



  doCheck = false;
}
