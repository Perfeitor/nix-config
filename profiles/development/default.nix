{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    curl
    ripgrep
    fd
    unzip
  ];
}