{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    curl
    ripgrep
    fd
    unzip
  ];
}