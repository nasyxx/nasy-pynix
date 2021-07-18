{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "black";
  version = "21.7b0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "06d27adq6v6p8wspi0wwqz2pnq34p5jhnqvijbin54yyj5j3qdy8";
  };
  format = "pyproject";
  buildInputs = with pypkgs; [ setuptools
                             setuptools-scm
                             wheel];
  propagatedBuildInputs = with pypkgs; [
      click
      appdirs
      toml
      tomli
      regex
      pathspec
      mypy-extensions
      colorama
    ];
}
