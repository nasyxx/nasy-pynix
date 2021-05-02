{ buildPythonPackage, fetchPypi }:

buildPythonPackage rec {
  pname = "pdm-pep517";
  version = "0.7.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1fg1lglz14x7dk0a8wp8bknjlx6w96fwz8dianlbi4am44fs4238";
  };

  format = "pyproject";
}
