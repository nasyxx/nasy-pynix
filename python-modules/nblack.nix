{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "black";
  version = "21.5b2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1dalz3wdy8hr1ga9a4w17r7nd6d2my4hmiphzjfjczdfr2if1h0z";
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
