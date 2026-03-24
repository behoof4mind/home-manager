{
  description = "Home Manager configuration with Flakes";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-25.05-darwin";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # The tool that fixes the macOS "Apps not found" issue
    mac-app-util.url = "github:hraban/mac-app-util";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      mac-app-util,
      ...
    }:
    let
      system = "aarch64-darwin"; # Use "x86_64-darwin" if you're on an Intel Mac
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations."denislavrushko" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home.nix here
        modules = [
          ./home.nix
          # This pulls in the mac-app-util logic automatically
          mac-app-util.homeManagerModules.default
        ];
      };
    };
}
