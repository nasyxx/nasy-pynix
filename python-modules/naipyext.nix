{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "naipyext";
  version = "0.7.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0hjp6rnjhv7kgb0x3mxcg5jz7sn18f62a4fcnfyi9s677mnpc264";
  };
  format = "pyproject";
  buildInputs = with pypkgs; [ pdm pdm-pep517 ];
  propagatedBuildInputs = with pypkgs; [
      better_exceptions
      httpx
      ipython
      jupyter_qtconsole_colorschemes
      numpy
      pandas
      pdir2
      pendulum
      ptpython
      rich
      sympy
      tqdm
    ];
}
