{
  description = "Home Manager configuration of user nixos";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-22.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations.nixos = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        inherit system;

        username = "nixos";
        homeDirectory = "/home/nixos";
        stateVersion = "22.05";

        configuration = ./home.nix;
        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        # modules = [  ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
