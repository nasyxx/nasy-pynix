{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "black";
  version = "21.5b1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1cdkrl5vw26iy7s23v2zpr39m6g5xsgxhfhagzzflgfbvdc56s93";
  };
  format = "pyproject";
  buildInputs = with pypkgs; [ setuptools
                             setuptools-scm
                             wheel];
  propagatedBuildInputs = with pypkgs; [
      click
      appdirs
      toml
      regex
      pathspec
      mypy-extensions
      colorama
    ];
}
