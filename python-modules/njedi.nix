{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "jedi";
  version = "";

  src = fetchGit {
    url = "https://github.com/davidhalter/jedi";
    ref = "master";
    submodules = true;
  };

  doCheck = false;

  propagatedBuildInputs = with pypkgs; [ parso ];
}
