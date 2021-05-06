{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "flake8-rst-docstrings";
  version = "0.2.3";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0yyl9dxdzdlv34h0p2zg8jfgr7inp13c59df7aiznrw43i77ji9h";
  };

  patchPhase = ''
    sed -i "s/yield start + rst_error.line, 0, msg, type(self)/yield (start or 0) + (rst_error.line or 0), 0, msg, type(self)/g" flake8_rst_docstrings.py
  '';

  propagatedBuildInputs = with pypkgs; [ flake8 restructuredtext_lint pydocstyle pygments ];
}
