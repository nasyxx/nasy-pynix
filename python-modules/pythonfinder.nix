{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "pythonfinder";
  version = "1.2.5";

  src = fetchPypi {
    inherit pname version;
    sha256 = "11hrzj9ql5a3a3vaykg2cabsfrf5rv5wbi5mnpjkz97znyfbl7s8";
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
