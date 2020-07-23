with (import <nixpkgs> {});
let
  env = bundlerEnv {
    name = "tempsensor-bundler-env";
    inherit ruby;
    gemfile  = ./Gemfile;
    lockfile = ./Gemfile.lock;
    gemset   = ./gemset.nix;
  };
in stdenv.mkDerivation {
  name = "tempsensor";
  buildInputs = [
  	env
	mariadb
	sqlite
	wkhtmltopdf
  ];
}
