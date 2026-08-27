{ pkgs, ... }:

{
  imports = [
    ../../modules/devops.nix
    ../../modules/agents.nix
    ../../modules/cache.nix
    ../../modules/lsp.nix
    ../../modules/home.nix
  ];

  wsl.enable = true;
  wsl.defaultUser = "guillaume";

  # Activation système requise par l'assertion users.users.*.shell,
  # la config utilisateur elle-même vit dans modules/home.nix (Home Manager).
  programs.zsh.enable = true;
  users.users.guillaume.shell = pkgs.zsh;

  # Le dépôt de config est copié dans /etc/nixos de l'image générée :
  # rebuild possible depuis la VM via `nixos-rebuild switch --flake /etc/nixos#wsl`.
  wsl.tarball.configPath = ../..;

  # vault et packer sont sous licence BSL (marqués unfree dans nixpkgs).
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.11";
}
