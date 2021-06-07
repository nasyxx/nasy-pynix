{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "protobuf";
  version = "3.17.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "03fl72ayf5crfpn2qfdfnfsz31kvzfnzg8q29x56wwa6y2n50d2s";
  };



  doCheck = false;
}
