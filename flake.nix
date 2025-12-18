# SPDX-License-Identifier: AGPL-3.0-or-later
# SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
#
# nick-shells - Nix Flake (fallback to guix.scm)
# Run: nix develop
{
  description = "nick-shells - RSR-compliant shell configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages.default = pkgs.stdenv.mkDerivation {
          pname = "nick-shells";
          version = "0.1.0";
          src = ./.;

          meta = with pkgs.lib; {
            description = "Nick's shell configuration collection - RSR compliant";
            homepage = "https://github.com/hyperpolymath/nick-shells";
            license = with licenses; [ agpl3Plus mit ];
            maintainers = [ ];
            platforms = platforms.all;
          };
        };

        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            # Development tools
            just
            git

            # Guile for .scm files
            guile

            # CI/CD linting
            actionlint
            yamllint
          ];

          shellHook = ''
            echo "nick-shells development environment"
            echo "Run 'just' to see available commands"
          '';
        };
      }
    );
}
