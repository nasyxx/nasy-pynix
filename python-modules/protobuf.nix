{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "protobuf";
  version = "3.15.6";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1lzwskhrmi2356c8ynbalh1y7q5vf2603yfg64gam0xfl8clb5rb";
  };



  doCheck = false;
}
