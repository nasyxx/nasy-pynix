{ buildPythonPackage, fetchPypi }:

buildPythonPackage rec {
  pname = "pdm-pep517";
  version = "0.5.10";

  src = fetchPypi {
    inherit pname version;
    sha256 = "128fdykga5hbz33vmy5sarwcxvv6g1jmbdcc9y54v52cnfcwl4pi";
  };

  format = "pyproject";
}
