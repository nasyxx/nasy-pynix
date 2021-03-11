{ buildPythonPackage, fetchPypi }:

buildPythonPackage rec {
  pname = "spinners";
  version = "0.0.24";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0zz2z6dpdjdq5z8m8w8dfi8by0ih1zrdq0caxm1anwhxg2saxdhy";
  };
}
