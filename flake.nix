{
  description = "Home Manager configuration";

  inputs = {
    # nixpkgs.url = "github:NixOS/nixpkgs";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager }:
    let
      # Values you should modify
      username = "alex"; # $USER
      system = "x86_64-linux";  # x86_64-linux, aarch64-multiplatform, etc.
      # system = "aarch64-darwin";
      stateVersion = "23.11";     # See https://nixos.org/manual/nixpkgs/stable for most recent

      pkgs = import nixpkgs {
        inherit system;

        config = {
          allowUnfree = true;
          nixpkgs.config.permittedInsecurePackages = [
            "jitsi-meet-1.0.8043"
          ];
        };
      };

      homeDirPrefix = if pkgs.stdenv.hostPlatform.isDarwin then "/Users" else "/home";
      homeDirectory = "/${homeDirPrefix}/${username}";

      home = (import ./home.nix {
        inherit homeDirectory pkgs stateVersion system username;
      });
    in {
      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          home
        ];
      };
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPkgs = true;
      home-manager.extraSpecialArgs = {
        inherit nixpkgs;
      };
      # packages.${system}.default = import nixpkgs { inherit system; };
      defaultPackage.${system} = home-manager.defaultPackage.${system};
    };
}
