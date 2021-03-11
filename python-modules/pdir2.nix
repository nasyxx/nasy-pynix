{ buildPythonPackage, fetchPypi, ... }:

buildPythonPackage rec {
  pname = "pdir2";
  version = "0.3.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1qymj4xmc4wv828rgdmrdlf79qqziq64dhpjnfzysk4rbnd4bmr6";
  };
}
