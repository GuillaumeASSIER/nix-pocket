{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Socle git/CLI
    git
    gh
    jq
    yq

    # Kubernetes
    kubectl
    kubernetes-helm
    k9s
    kustomize
    fluxcd
    stern

    # IaC / provisioning
    opentofu
    terragrunt
    ansible
    packer
    vault

    # Containers
    docker-compose
    dive
    hadolint
    trivy
  ];

  # Hook shell intégré plutôt que le paquet nu.
  programs.direnv.enable = true;
}
