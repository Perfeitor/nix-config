{ pkgs, nvim-config, tmux-config, tpm, ... }:

{
  time.timeZone = "Asia/Ho_Chi_Minh";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.networkmanager.enable = true;
  services.openssh.enable = true;

  environment.systemPackages = with pkgs; [
    git
    gh
    gnupg
    pinentry-curses
    wget
    lazygit
  ];

  programs.gnupg.agent.enable = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    histSize = 10000;
    setOptions = [
      "HIST_IGNORE_DUPS"
      "SHARE_HISTORY"
      "HIST_IGNORE_SPACE"
      "AUTO_CD"
    ];
    shellAliases = {
      ll = "ls -la";
      gs = "git status";
    };

    interactiveShellInit = ''
      export GPG_TTY=$(tty)
    '';

    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    promptInit = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
    '';

    ohMyZsh = {
      enable = true;
      theme = "";
      plugins = [ "git" "z" "sudo" ];
    };
  };

  programs.fzf = {
    keybindings = true;
    fuzzyCompletion = true;
  };

  users.defaultUserShell = pkgs.zsh;
 
  home-manager.extraSpecialArgs = { inherit nvim-config tmux-config tpm; };
  home-manager.users.perfeitor = import ../../home/perfeitor;

  fonts.packages = with pkgs; [ nerd-fonts.jetbrains-mono ];
}
