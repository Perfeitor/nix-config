{ pkgs, nvim-config, ... }:

{
  home.packages = with pkgs; [
    neovim
    gcc gnumake
    cargo rustc
    git ripgrep fd unzip nodejs python3
    wl-clipboard xclip
  ];

  xdg.configFile."nvim/init.lua".source = "${nvim-config}/init.lua";
  xdg.configFile."nvim/lua".source     = "${nvim-config}/lua";
}