{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "restructuredtext_lint";
  version = "1.3.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "101w2zgl7hh8dgmyal6xmygxwy1v48diavdfa5z57b7cw8ghmcfk";
  };

  doCheck = false;
  propagatedBuildInputs = with pypkgs; [ docutils ];
}
