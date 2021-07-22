{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "flit_core";
  version = "3.2.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0cclv7v4cmzi457bzqsx9ig8ir1ha3ip8h1kx8qfy95wbmfg51zz";
  };

  format = "pyproject";

  doCheck = false;

  propagatedBuildInputs = with pypkgs; [
    toml
  ];
}
