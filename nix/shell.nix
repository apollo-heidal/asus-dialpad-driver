{
  pkgs,
  ...
}:
let
  python311Packages = pkgs.python311Packages;
  mainPkg = python311Packages.callPackage ./default.nix {};
in
mainPkg.overrideAttrs (oa: {
    nativeBuildInputs =
      [
        python311Packages.pip
      ]
      ++ (oa.nativeBuildInputs or []);
})
