{ buildPythonPackage, fetchPypi }:

buildPythonPackage rec {
  pname = "pdm-pep517";
  version = "0.5.8";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0zxaz1xjadpcp5d2zix0wgxi7bvwxnwqwrj6vi2f5rj0c6gskajz";
  };

  format = "pyproject";
}
