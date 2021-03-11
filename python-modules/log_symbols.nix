{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "log_symbols";
  version = "0.0.14";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0mh5d0igw33libfmbsr1ri1p1y644p36nwaa2w6kzrd8w5pvq2yg";
  };

  propagatedBuildInputs = [ pypkgs.colorama ];
}
