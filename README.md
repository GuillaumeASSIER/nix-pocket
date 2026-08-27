# nix-pocket

Config NixOS-WSL (flakes) avec outillage DevOps et l'agent `omp` (oh-my-pi) de [llm-agents.nix](https://github.com/numtide/llm-agents.nix).

## Structure

```
flake.nix              # inputs : nixpkgs (unstable), nixos-wsl, llm-agents
hosts/wsl/default.nix  # hôte « wsl » : options WSL + tarball.configPath
modules/devops.nix     # socle git/CLI, k8s, IaC, containers
modules/agents.nix     # omp (oh-my-pi)
modules/lsp.nix        # serveurs LSP complétant omp
```

## rebuild dans la VM


Le dépôt complet est copié dans `/etc/nixos` de l'image (`wsl.tarball.configPath`) :

```sh
sudo nixos-rebuild switch --flake /etc/nixos#wsl
```

## CI

Un run GitHub Actions (`.github/workflows/build.yml`) construit l'image à chaque push sur `main`
et publie l'artefact `nixos.wsl` : `wsl --import NixOS ./NixOS nixos.wsl`.

## Construire l'image .wsl (depuis un hôte Linux avec nix)

`nixos-install` impose EUID 0 :

```sh
nix build .#nixosConfigurations.wsl.config.system.build.tarballBuilder
sudo ./result-tarball/bin/nixos-wsl-tarball-builder nixos.wsl
```

Import sous Windows : double-clic sur `nixos.wsl` (WSL >= 2.4.4), puis `wsl -d NixOS`.

## Outils installés

| Catégorie | Outils |
|---|---|
| Socle git/CLI | git, gh, jq, yq, direnv |
| Kubernetes | kubectl, helm, k9s, kustomize, fluxcd, stern |
| IaC / provisioning | opentofu (`tofu`), terragrunt, ansible, packer, vault |
| Containers | docker-compose, dive, hadolint, trivy |
| LSP (complète omp) | ruff, basedpyright, rust-analyzer, gopls, tsserver (`typescript`), biome, vscode-json-language-server, yaml-language-server, marksman |
| Agents IA | omp 18.x (oh-my-pi), via llm-agents.nix |
