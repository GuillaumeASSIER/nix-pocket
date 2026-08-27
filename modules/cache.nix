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
      "nix.guillaume.engineer-1:Oc3grlRCR5P6WO58nYbLNRDkG29t8T5uBRrGL2ZMS2k="
    ];
    # connect-timeout bas : si le cache perso est indisponible (DNS, panne),
    # le build continue immédiatement via cache.nixos.org.
    connect-timeout = 5;
  };
}
