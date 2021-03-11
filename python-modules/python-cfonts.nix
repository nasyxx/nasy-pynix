{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "python-cfonts";
  version = "1.4.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0wk34rs2yw496yvb2k833pzymsbd67l7bim9242y6dr9kl1vyhjh";
  };

  format = "pyproject";
  propagatedBuildInputs = [ pypkgs.colorama ];
  buildInputs = [ pypkgs.pdm-pep517 ];
}
