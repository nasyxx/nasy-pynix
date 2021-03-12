{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "flake8-commas";
  version = "2.0.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1ds41zg7bfcmi5m2qjjg1xm6dv5gb7xm2wfzhw1khlbg8scmh06k";
  };

  doCheck = false;
  propagatedBuildInputs = with pypkgs; [ flake8 ];
}
