{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvim-config = {
      url = "github:Perfeitor/nvim-config";
      flake = false;
    };

    tmux-config = {
      url = "github:Perfeitor/tmux-config";
      flake = false;
    };

    tpm = {
      url = "github:tmux-plugins/tpm";
      flake = false;  
    };
  };

  outputs = { self, nixpkgs, home-manager, nvim-config, tmux-config, tpm, ... }: {
    nixosConfigurations.ark-vm = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/nixos/ark-vm
        home-manager.nixosModules.home-manager
      ];
      specialArgs = { inherit nvim-config tmux-config tpm; };
    };
  };
}