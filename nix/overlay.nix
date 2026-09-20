self: final: prev: let
    lua = prev.luajit_lux.override {
    packageOverrides = _final: _prev: {lux-lua = prev.lux-luajit;};
  };

in {
  lux-nvim =
    final.toLuxNeovimPlugin ((final.buildLuxPackage {
      inherit lua;
    }) {
      pname = "lux-nvim";
      version = "3.0.0";
      src = self;
      luxHash = "sha256-GpRE5NkHhQQeuErMn4ryjyZfC95ThPNbAamzFEeEINE=";
      rustSupport = true;
      nativeBuildInputs = with final; [
          pkg-config
          perl
      ];
      buildInputs = with final; [
          openssl
      ];
    });
}
