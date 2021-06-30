{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "pythonfinder";
  version = "1.2.7";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0bikq04gncw0lk0whwjja9vj8xq3p7z10w8884irzl4mn7brc5wm";
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
