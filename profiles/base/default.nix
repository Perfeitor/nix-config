{ pkgs, ... }:

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

  networking.networkmanager.enable = true;
  services.openssh.enable = true;

  environment.systemPackages = with pkgs; [
    git
    gh
    gnupg
    pinentry-curses
    wget 
  ];

  programs.gnupg.agent.enable = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;          # tab-completion
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

    ohMyZsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" "z" "sudo" "fzf" "zsh-autosuggestions" "zsh-syntax-highlighting" ];
    };
  };

  programs.fzf.enable = true;

  users.defaultUserShell = pkgs.zsh;
}