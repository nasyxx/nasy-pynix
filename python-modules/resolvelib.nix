{ buildPythonPackage, fetchPypi }:

buildPythonPackage rec {
  pname = "resolvelib";
  version = "0.7.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0s088zdsgb06y2zp490hqksflsjx1q4zxswq2gswympx96zshh48";
  };

  format = "pyproject";
}
