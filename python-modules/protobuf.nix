{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "protobuf";
  version = "3.17.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1qcji772shc8aqdsk0fqzdnbvg337vqggvkhkqx9pvdc4cf4zg15";
  };



  doCheck = false;
}
