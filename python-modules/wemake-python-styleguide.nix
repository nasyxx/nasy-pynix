{ buildPythonPackage, fetchPypi, pypkgs }:

buildPythonPackage rec {
  pname = "wemake-python-styleguide";
  version = "0.15.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "06csx3ldmms9hy7zx061yliiw1gi7qrs0pv3ayyjdxyp78yknrj6";
  };

  format = "pyproject";
  buildInputs = [ pypkgs.poetry-core ];

  patchPhase = ''
    sed -i 's/flake8-bugbear.*/flake8-bugbear = "*"/g' pyproject.toml
    sed -i 's/flake8-rst-docstrings.*/flake8-rst-docstrings = "*"/g' pyproject.toml
  '';
  propagatedBuildInputs = with pypkgs;
     [
      flake8
      attrs
      typing-extensions
      astor
      pygments
      flake8-commas
      flake8-quotes
      flake8-comprehensions
      flake8-docstrings
      flake8-string-format
      flake8-bugbear
      flake8-debugger
      flake8-isort
      flake8-eradicate
      flake8_bandit
      flake8-broken-line
      flake8-rst-docstrings
      pep8-naming
      darglint
    ];
}
