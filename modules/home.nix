# Home Manager pour le compte guillaume (utilisateur par défaut de la VM WSL)
{ config, ... }:

let
  user = config.wsl.defaultUser; # « guillaume »
in
{
  home-manager.users.${user} = {
    home.username = user;
    home.homeDirectory = "/home/${user}";
    home.stateVersion = "25.11";

    programs.zsh = {
      enable = true;

      # Invalide le cache de complétion après 24h au lieu des 7 jours
      # par défaut de compinit.
      completionInit = ''
        autoload -Uz compinit
        rm -f $HOME/.zcompdump(N.mh+24)
        compinit
      '';

      shellAliases = {
        ll = "ls -l";
        k = "kubectl";
        tf = "tofu";
        hm-switch = "sudo nixos-rebuild switch --flake /etc/nixos#wsl";
      };

      syntaxHighlighting.enable = true;
      autosuggestion.enable = true;

      history = {
        size = 50000;
        save = 50000;
        ignoreDups = true;
        share = true;
      };
    };
  };
}
