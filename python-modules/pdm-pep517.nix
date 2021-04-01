{ buildPythonPackage, fetchPypi }:

buildPythonPackage rec {
  pname = "pdm-pep517";
  version = "0.6.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1i8531si26fqpsyds12f24zd4sacvh5k6lp3hkam1634kydc0bfy";
  };

  format = "pyproject";
}
