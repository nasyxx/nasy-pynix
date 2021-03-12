{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "flake8-eradicate";
  version = "1.0.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0nsz5kvmx83i4mln0llc75d6qmvg58q341alrx83v0kncqi6fwgy";
  };

  propagatedBuildInputs = with pypkgs; [ flake8 eradicate attrs ];
}
