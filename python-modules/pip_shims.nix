{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "pip_shims";
  version = "0.5.3";

  src = fetchPypi {
    inherit pname version;
    sha256 = "14byzw4m9snnz89ikhix52bki4wac2qdjvb5pfc6ls0ykpg0mc05";
  };
  buildInputs = with pypkgs; [ setuptools wheel packaging ];
}
