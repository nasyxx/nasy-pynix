{ buildPythonPackage, fetchPypi, pypkgs, ... }:

buildPythonPackage rec {
  pname = "torch";
  version = "1.9.0";

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
    sha256 = "0mdkdw8dlpjh1rsf2llw57hwjgwrf1b2lcyram7cwqvl0nsp97ha";
    platform = "macosx_10_9_x86_64";
    python = "cp39";
  };
}
