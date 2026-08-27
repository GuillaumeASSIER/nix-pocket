# Agents IA issus de github:numtide/llm-agents.nix
{ pkgs, llm-agents, ... }:

{
  environment.systemPackages = [
    # TUI and agentic tasks
    llm-agents.packages.${pkgs.system}.omp
    llm-agents.packages.${pkgs.system}.antigravity-cli
    llm-agents.packages.${pkgs.system}.claude-code
    llm-agents.packages.${pkgs.system}.codex
    llm-agents.packages.${pkgs.system}.mimo-code
    llm-agents.packages.${pkgs.system}.opencode2
    llm-agents.packages.${pkgs.system}.skills

    # Browser tools
    llm-agents.packages.${pkgs.system}.agent-browser
    pkgs.google-chrome
  ];
}
