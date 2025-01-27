{
  description = "site";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    # Import theme
    risotto-src = {
      url = "github:joeroe/risotto";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  } @ inputs:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};

      site = pkgs.stdenv.mkDerivation {
        name = "site";
        # Exclude themes and public folder from build sources
        src =
          builtins.filterSource
          (path: type:
            !(type
              == "directory"
              && (baseNameOf path
                == "themes"
                || baseNameOf path == "public")))
          self;
        # Link theme to themes folder and build
        buildPhase = ''
          mkdir -p themes
          ln -s ${inputs.risotto-src} themes/risotto
          ${pkgs.hugo}/bin/hugo --minify
        '';
        installPhase = ''
          cp -r public $out
        '';
        meta = with pkgs.lib; {
          description = "site";
          platforms = platforms.all;
        };
      };
    in {
      packages = {
        inherit site;
        default = site;
      };

      devShells.default = pkgs.mkShell {
        buildInputs = with pkgs; [hugo];
        # Link theme to themes folder
        shellHook = ''
          mkdir -p themes
          ln -sf ${inputs.risotto-src} themes/risotto
        '';
      };
    });
}
