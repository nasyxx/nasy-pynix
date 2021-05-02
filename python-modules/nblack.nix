{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "black";
  version = "21.4b2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1g3v0s4frh23rks34xc2jmvrq6y0kl3jr23abzrw219b90xwz6zw";
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
