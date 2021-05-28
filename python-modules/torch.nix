{ buildPythonPackage, fetchPypi, pypkgs, ... }:

buildPythonPackage rec {
  pname = "torch";
  version = "1.8.1";

  format = "wheel";

  propagatedBuildInputs = with pypkgs; [
    cffi
    click
    numpy
    pyyaml
    typing-extensions
  ];

  src = fetchPypi {
    inherit pname version format;
    sha256 = "";
    platform = "macosx_10_9_x86_64";
    python = "cp39";
  };
}
