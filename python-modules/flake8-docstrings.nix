{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "flake8-docstrings";
  version = "1.5.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "05rpdydx1wdpfm4vpqmwq130ljmrjg17xa06cpm6fwvbxk3k2nix";
  };

  propagatedBuildInputs = with pypkgs; [ flake8 pydocstyle ];
}
