{ buildPythonPackage, fetchPypi }:

buildPythonPackage rec {
  pname = "better_exceptions";
  version = "0.3.3";
  src = fetchPypi {
    inherit pname version;
    sha256 = "0fs5nfg7xdbx5hb1h1148kax68g9wn0h7cclx3k08psd8hcbrrp4";
  };
  doCheck = false;
}
