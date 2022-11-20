{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    ripgrep
    fd
    file
  ];

  # Do NOT let Home Manager install and manage itself, because we installed it via Flake
  programs = {
      git = {
          enable = true;
          userName = "PingZing";
          userEmail = "later@later.com";          
      };
      home-manager.enable = false;

  };  
}