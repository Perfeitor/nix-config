{ pkgs, tmux-config, tpm, ... }:

{
  home.packages = with pkgs; [ tmux git wl-clipboard xclip xsel ];

  # ~/tmux-config -> store, để khớp path trong .tmux.conf
  home.file."tmux-config".source       = tmux-config;
  home.file.".tmux.conf".source        = "${tmux-config}/.tmux.conf";
  home.file.".tmux/plugins/tpm".source = tpm;
}