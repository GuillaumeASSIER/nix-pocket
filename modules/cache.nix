# Cache binaire personnel hébergé sur nix.guillaume.engineer (Harmonia/nix-serve)
{ ... }:

{
  nix.settings = {
    substituters = [
      "https://cache.nixos.org"
      "https://nix.guillaume.engineer"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix.guillaume.engineer-1:KS4Ap78vxJkaD9FTZtjcKAzD6NHQOn28/IUId/5e3kA="
    ];
    # connect-timeout bas : si le cache perso est indisponible (DNS, panne),
    # le build continue immédiatement via cache.nixos.org.
    connect-timeout = 5;
  };
}
