{
  imports = [
    ../../modules/devops.nix
    ../../modules/agents.nix
    ../../modules/lsp.nix
  ];

  wsl.enable = true;
  wsl.defaultUser = "heap";
  # Le dépôt de config est copié dans /etc/nixos de l'image générée :
  # rebuild possible depuis la VM via `nixos-rebuild switch --flake /etc/nixos#wsl`.
  wsl.tarball.configPath = ../..;

  # vault et packer sont sous licence BSL (marqués unfree dans nixpkgs).
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.11";
}
