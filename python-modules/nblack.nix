{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "black";
  version = "21.6b0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "016f6bhnnnbcrrh3cvmpk77ww0nykv5n1qvgf8b3044dm14264yw";
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
