{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "jupyter_qtconsole_colorschemes";
  version = "0.8.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0lfl67i3pklpf6pwd0swnsgrim13hbp29fchh972yg71df92xq96";
  };
  propagatedBuildInputs = with pypkgs; [ pygments ];
}
