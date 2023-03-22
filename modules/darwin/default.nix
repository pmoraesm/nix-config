{ config, pkgs, ... }:

{
  programs.zsh.enable = true;
  environment.shells = [ pkgs.bash pkgs.zsh ];
  environment.loginShell = pkgs.zsh;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  services.nix-daemon.enable = true;
  system.defaults.finder.AppleShowAllExtensions = true;
  system.defaults.finder._FXShowPosixPathInTitle = true;
  # Homebrew
  homebrew = {
  enable = true;
  caskArgs.no_quarantine = true;
  global.brewfile = true;
  masApps = { };
  casks = [ "raycast" ];
  };
}

