{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "flake8-comprehensions";
  version = "3.5.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0ngmq4ly4wx6p2nq6hv99y1ncvjvfnzndl66bdx7y4l74l1yjjzj";
  };

  propagatedBuildInputs = with pypkgs; [ flake8 ];
}
