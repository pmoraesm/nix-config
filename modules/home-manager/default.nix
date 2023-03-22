{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "paulo";
  home.homeDirectory = "/Users/paulo";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Packages
  home.packages = [
    pkgs.nerdfonts
    pkgs.alacritty
  ];

  # Git
  programs.git = {
    enable = true;
    userName  = "Paulo";
    userEmail = "pm85@proton.me";
    ignores = [
      ".vscode"
      ".venv"
      ".DS_Store"
    ];
  };

  # ZSH
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    shellAliases = {
      ls = "ls --color=auto -F";
      nixswitch = "darwin-rebuild switch --flake ~/.config/.#";
      nixup = "pushd ~/.config; nix flake update; nixswitch; popd";
      code = "open -a Visual\\ Studio\\ Code.app";
    };
  };

  #Alacritty
  programs.alacritty = {
    enable = true;
    settings.font.normal.family = "MesloLGL Nerd Font Mono";
    settings.font.size = 14;
  };
}
