{ buildPythonPackage, fetchPypi }:

buildPythonPackage rec {
  pname = "resolvelib";
  version = "0.7.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1sdchmfxd1dncxqxf0pbassvzn9ih9rnrn32ca20inc0y2kws9n5";
  };

  format = "pyproject";
}
