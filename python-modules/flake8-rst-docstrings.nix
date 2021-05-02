{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "flake8-rst-docstrings";
  version = "0.2.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1iwhwhg7yvmj4xpgj6183sm384m81j5ffhrj27n0al242n4wf48j";
  };

  patchPhase = ''
  sed -i "s/yield definition.start + rst_error.line, 0, msg, type(self)/yield definition.start + (rst_error.line or 0), 0, msg, type(self)/g" flake8_rst_docstrings.py
  '';

  propagatedBuildInputs = with pypkgs; [ flake8 restructuredtext_lint pydocstyle pygments ];
}
