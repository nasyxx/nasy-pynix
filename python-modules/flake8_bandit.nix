{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "flake8_bandit";
  version = "2.1.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0fyyn2q3j1v94d70bwsl146scwim1684mrgjd8h9n8sa5vdchzv8";
  };

  doCheck = false;
  propagatedBuildInputs = with pypkgs; [ bandit flake8 flake8-polyfill pycodestyle ];
}
