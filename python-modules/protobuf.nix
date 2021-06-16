{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "protobuf";
  version = "3.17.3";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0yyx9wf18gamyfm9gr2s5nv77chg50z820r81l4jmhm9xajlx03j";
  };



  doCheck = false;
}
