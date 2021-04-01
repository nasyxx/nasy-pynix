{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "pythonfinder";
  version = "1.2.6";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1x55civ4w8k1ylwxll70nga386havz39h74vgmf4rq9a2mxvgzr1";
  };

  propagatedBuildInputs = with pypkgs; [
      attrs
      cached-property
      click
      packaging
      six
    ];
  format = "pyproject";
}
