{ lib, buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "atoml";
  version = "1.0.3";

  format = "pyproject";

  src = fetchPypi {
    inherit pname version;
    sha256 = "154f44hfjy9pxs1k4zgl71dzjaw3bnpwds5jbnmad56ymzy0xmsx";
  };

  doCheck = false;

  propagatedBuildInputs = with pypkgs; [ pep517 pdm-pep517 ];

  meta = with lib; {
    homepage = "https://github.com/frostming/atoml";
    description = "Yet another style-preserving TOML library for Python";
    license = licenses.mit;
    maintainers = with maintainers; [ frostming ];
  };
}
