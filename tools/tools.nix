_: {
  perSystem =
    {
      pkgs,
      crane,
      ...
    }:
    {
      packages = {
        inherit (crane.buildWorkspaceMember "tools/devnet-utils" { }) devnet-utils;
        inherit (crane.buildWorkspaceMember "tools/build-evm-deployer-tx" { }) build-evm-deployer-tx;

        ignite-cli = pkgs.buildGoModule {
          name = "ignite-cli";
          src = pkgs.fetchFromGitHub {
            owner = "ignite";
            repo = "cli";
            rev = "v28.7.0";
            sha256 = "sha256-/gBykwBlZsHUWCJ01rdluU10xuEEmPmCfzSWlO6znW8=";
          };
          doCheck = false;
          vendorHash = "sha256-ks9wZUIwN0dOcXxxRk1Amxd0TPJBbLfKC9lzV4IMdjk=";
        };
      };
    };
}
