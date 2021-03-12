{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "darglint";
  version = "1.7.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0cdbvssl0rxl4c80y0zwln09zhiikwzd425mi2lsjwj2kfn3d6z4";
  };

  doCheck = false;

}
