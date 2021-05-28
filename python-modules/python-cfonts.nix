{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "python-cfonts";
  version = "1.5.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0qlgzhk3n07vd8d35ryys0wx4qh8gfg97gm7bfzjlcjxqq91knvn";
  };

  format = "pyproject";
  propagatedBuildInputs = [ pypkgs.colorama ];
  buildInputs = [ pypkgs.pdm-pep517 ];
}
