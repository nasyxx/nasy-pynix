{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "flit_core";
  version = "3.2.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-/4fyXF28JO8w6jNAdONQMOSIXkxd479OIfFXRvbZlDE=";
  };

  format = "pyproject";

  doCheck = false;port

  propagatedBuildInputs = with pypkgs; [
    toml
  ];
}
