{ config, pkgs, ... }:

{
  programs.zsh.enable = true;
  environment = {
    shells = [ pkgs.bash pkgs.zsh ];
    loginShell = pkgs.zsh;
    systemPackages = [ pkgs.coreutils ];
    systemPath = [ "/opt/homebrew/bin" ];
    pathsToLink = [ "/Applications" ];
  };
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  services.nix-daemon.enable = true;
  fonts ={
    fontDir.enable = true;
  };
  system.defaults = {
    finder.AppleShowAllFiles = true;
    finder.AppleShowAllExtensions = true;
    finder.FXPreferredViewStyle = "clmv"; # "icnv" = Icon view, "Nlsv" = List view, "clmv" = Column View, "Flwv" = Gallery View
    finder._FXShowPosixPathInTitle = true;
    dock.autohide = true;
  };
  # Homebrew
  homebrew = {
    enable = true;
    caskArgs.no_quarantine = true;
    global.brewfile = true;
    masApps = { };
    taps = [ 
      "microsoft/git"
    ];
    brews = [
      "gh"
    ];
    casks = [ 
      "raycast"
      "docker"
      "maccy"
      "rocket-typist"
      "git-credential-manager-core"
      "spotify"
    ];
  };
}

