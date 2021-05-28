{ buildPythonPackage, fetchPypi }:

buildPythonPackage rec {
  pname = "pdm-pep517";
  version = "0.7.4";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0mfbm47yfxyx59a1zizi0ynwsg83ibbx6zfwx0ncbmii6730k12k";
  };

  format = "pyproject";
}
