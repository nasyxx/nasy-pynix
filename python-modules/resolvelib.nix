{ buildPythonPackage, fetchPypi }:

buildPythonPackage rec {
  pname = "resolvelib";
  version = "0.5.4";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0a3nd359w345k58jwqqmw9s1vh4x8k1i41xzgy5jlk0fqvaq16wv";
  };

  format = "pyproject";
}
