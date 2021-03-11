{ buildPythonPackage, fetchPypi }:

buildPythonPackage rec {
  pname = "pdm-pep517";
  version = "0.5.7";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0kiiyd2xb6hvy44gr1nkhwdixwv6rnch4jm0lg1i6whdn48vcimx";
  };

  format = "pyproject";
}
