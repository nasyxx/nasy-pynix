{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "flake8-docstrings";
  version = "1.6.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0jy3i9q57kl45gpwlfdvhigsa7gbx5hjyp055bkghjh60siwdrwz";
  };

  propagatedBuildInputs = with pypkgs; [ flake8 pydocstyle ];
}
