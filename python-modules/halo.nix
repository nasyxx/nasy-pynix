{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "halo";
  version = "0.0.31";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1mn97h370ggbc9vi6x8r6akd5q8i512y6kid2nvm67g93r9a6rvv";
  };

  propagatedBuildInputs = with pypkgs; [
      colorama
      log_symbols
      spinners
      termcolor
      six
    ];
}
