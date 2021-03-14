{ buildPythonPackage, fetchPypi }:

buildPythonPackage rec {
  pname = "mac-app-frontmost";
  version = "2020.12.3";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1gyi3zwyba44akxbk6pg7kj77mac152sx0vfcvgcvd7i4jjm0c5n";
  };
}
