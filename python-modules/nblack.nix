{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "black";
  version = "21.5b0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0hwrblcfm14ks1wzdmd3fkn6vbcw5p0w4i6rcr9p646a30h09hlx";
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
