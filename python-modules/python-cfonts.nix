{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "python-cfonts";
  version = "1.5.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0c60fyfww66wyb2k56yj1vqwjd6hp9amg9mamy3bjz9w01qqwn45";
  };

  format = "pyproject";
  propagatedBuildInputs = [ pypkgs.colorama ];
  buildInputs = [ pypkgs.pdm-pep517 ];
}
