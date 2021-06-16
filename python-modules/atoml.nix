{ lib, buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "atoml";
  version = "1.0.2";

  format = "pyproject";

  src = fetchPypi {
    inherit pname version;
    sha256 = "184paf40nwna9q6i5lzyzabw2mpxrhsas9vjaq53pmja60cw5c3b";
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
