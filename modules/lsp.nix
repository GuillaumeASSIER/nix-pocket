# Serveurs LSP complétant l'agent omp (oh-my-pi)
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Python : linter/formateur + type checker
    ruff # inclut `ruff server` (LSP intégré depuis v0.5)
    basedpyright # fournit aussi basedpyright-langserver

    # Rust / Go
    rust-analyzer
    gopls

    # TypeScript / JavaScript
    typescript # fournit tsserver + tsc

    # Web
    biome # formatter/linter, LSP via `biome lsp-proxy`
    vscode-json-languageserver # binaire vscode-json-language-server

    # Données / docs
    yaml-language-server
    marksman # Markdown
  ];
}
