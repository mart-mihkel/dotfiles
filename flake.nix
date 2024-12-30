{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }: let
    x86 = "x86_64-linux";
    arm = "aarch64-linux";

    kubujuss = make-users { kubujuss = import ./homes/kubujuss.nix; };
    kubujuss-head = make-users { kubujuss = import ./homes/kubujuss-head.nix; };

    make-users = users: [
      home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          inherit users;
        };
      }
    ];
  in {
    nixosConfigurations = {
      dell = nixpkgs.lib.nixosSystem {
        system = "${x86}";
        modules = [ ./devices/dell ] ++ kubujuss-head;
      };

      jaam = nixpkgs.lib.nixosSystem {
        system = "${x86}";
        modules = [ ./devices/jaam ] ++ kubujuss;
      };

      alajaam = nixpkgs.lib.nixosSystem {
        system = "${arm}";
        modules = [ ./devices/alajaam ] ++ kubujuss;
      };
    };
  };
}
