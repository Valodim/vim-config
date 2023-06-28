let
  pkgs = import <nixpkgs> {};
in pkgs.mkShell {
  buildInputs = with pkgs; [
    gnumake42
    gcc
    sumneko-lua-language-server
  ];
}
