{ ... }:

{
  imports = [ 
    ../../modules/home-manager/neovim.nix
    ../../modules/home-manager/tmux.nix
    ../../modules/home-manager/btop.nix
  ];

  home.username = "perfeitor";
  home.homeDirectory = "/home/perfeitor";
  home.stateVersion = "26.05";
}
