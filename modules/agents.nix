# Agents IA issus de github:numtide/llm-agents.nix
{ pkgs, llm-agents, ... }:

{
  environment.systemPackages = [
    # oh-my-pi : agent de codage en terminal multi-modèles
    llm-agents.packages.${pkgs.system}.omp
  ];
}
