{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    neovim
    curl
    wget
    ripgrep
    fd
    unzip
  ];
}