{ lib, buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "tomli";
  version = "1.0.4";

  format = "pyproject";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0s62r5ar6xjjr722q1nynh36gb533fxxffqil07gsw3mil6hsrxy";
  };

  doCheck = false;

  propagatedBuildInputs = with pypkgs; [ pep517 flit_core ];

  meta = with lib; {
    homepage = "https://github.com/hukkin/tomli";
    description = "A lil' TOML parser";
    license = licenses.mit;
    maintainers = with maintainers; [ hukkin ];
  };
}
