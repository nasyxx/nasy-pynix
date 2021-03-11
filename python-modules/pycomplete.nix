{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "pycomplete";
  version = "0.3.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "14a3b1zhdf28rmnca33rrmriagxaqaxalvbbmpnyqbkg1fkzn6v7";
  };
  format = "pyproject";
  buildInputs = [ pypkgs.pdm-pep517 ];
}
