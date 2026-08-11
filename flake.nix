{
  description = "A modern approach to Neovim plugin management";

  nixConfig = {
    extra-substituters = "https://lumen-labs.cachix.org";
    extra-trusted-public-keys = "lumen-labs.cachix.org-1:WmGwJxPmN6cIqKJHYTq/C1WIaqIUneH+t+BAT34Qag0=";
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    inputs@{
      self,
      ...
    }:
    let
      inherit (inputs.nixpkgs) lib;
      foreach =
        xs: f:
        with lib;
        foldr recursiveUpdate { } (
          if isList xs then
            map f xs
          else if isAttrs xs then
            mapAttrsToList f xs
          else
            throw "foreach: expected list or attrset but got ${typeOf xs}"
        );

    in
    foreach inputs.nixpkgs.legacyPackages (
      system: pkgs:
      let
        pkgs = inputs.nixpkgs.legacyPackages.${system};
      in
      {
        legacyPackages.${system} = pkgs;
        devShells.${system}.default = pkgs.mkShell {
          name = "lux.nvim devShell";
          buildInputs =
            with pkgs;
            with pkgs;
            [
              lux-cli
              luajit
              pkg-config
              cargo
              emmylua-ls
            ];
          shellHook = ''
            # for `lx check`
            if command -v nvim >/dev/null 2>&1; then
              export VIMRUNTIME="$(nvim --clean --headless -c 'lua io.write(vim.env.VIMRUNTIME)' +q)";
            else
              export VIMRUNTIME="${pkgs.neovim-unwrapped}/share/nvim/runtime"
            fi
          '';
        };
      }
    );
}
