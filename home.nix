{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "yuya.takeyama";
  home.homeDirectory = "/Users/yuya.takeyama";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    vim
    git
    htop
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/yuya.takeyama/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "vim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Yuya Takeyama";
    userEmail = "sign.of.the.wolf.pentagram@gmail.com";
    extraConfig = {
      user.signingKey = "9D741810ED54EE55";

      init = {
        defaultBranch = "main";
      };
      core.editor = "vim -c \"set fenc=utf-8\"";
      core.autocrlf = "input";
      core.safecrlf = "true";
      core.excludesfile = "/Users/yuya-takeyama/.gitignore.global";

      color.ui = "true";

      alias.gr = "log --graph --date=short --decorate=short --pretty=format:'%Cgreen%h %Creset%cd %Cblue%cn %Cred%d %Creset%s'";

      ghq.root = "/Users/yuya.takeyama/src";

      pager.log = "${pkgs.git}/share/git/contrib/diff-highlight/diff-highlight | less";
      pager.show = "${pkgs.git}/share/git/contrib/diff-highlight/diff-highlight | less";
      pager.diff = "${pkgs.git}/share/git/contrib/diff-highlight/diff-highlight | less";

      credential.helper = "/usr/local/share/gcm-core/git-credential-manager";
      "credential.https://dev.azure.com".useHttpPath = "true";

      commit.gpgsign = "true";
    };
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;

    history = {
      ignoreDups = true;
      save = 1000000;
      size = 1000000;
    };

    initExtra = ''
      eval "$(/opt/homebrew/bin/brew shellenv)"

      # peco + ghq
      # ref: https://miyagawa.co/blog/ghq-peco-percol
      function peco-src () {
        local selected_dir=$(ghq list --full-path | peco --query "$LBUFFER")
        if [ -n "$selected_dir" ]; then
          BUFFER="cd $selected_dir"
          zle accept-line
        fi
        zle clear-screen
      }
      zle -N peco-src
      bindkey '^]' peco-src

      export GOPATH="$HOME"
      export PATH="$GOPATH/bin:$PATH"

      # Rancher Desktop
      export PATH="$PATH:$HOME/.rd/bin"

      export NVM_DIR="$HOME/.nvm"
      [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
      [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
    '';

    oh-my-zsh = {
      enable = true;
      theme = "daveverwer";
      plugins = [
        "aws"
        "docker"
        "git"
        "man"
        "tig"
        "tmux"
        "yarn"
        "zsh-navigation-tools"
      ];
    };
  };

  programs.tmux = {
    enable = true;
    clock24 = true;
    extraConfig = ''
      # base settings
      set -s escape-time 0
      set-option -g history-limit 10000

      # key mappings
      set-window-option -g mode-keys vi
      unbind ^A
      bind ^t last-window
      bind r source-file ~/.tmux.conf; display-message "Reload Config!!"

      # base index at 1
      set -g base-index 1
      set -g pane-base-index 1

      # color settings
      set-option -g default-terminal "screen-256color"
      set -g status-fg white
      set -g status-bg colour234
      set -g pane-border-style fg="colour245"
      set -g pane-active-border-style fg="colour39"

      # status line
      set -g status-interval 1
      set -g status-left-length 32
      set -g status-left '#[fg=colour244] #h [#S:#I.#P] |'
      set -g window-status-format " #I #W #F "
      set -g window-status-current-format "#[fg=white,bg=colour237] #I #W #F "
      set -g status-right-length 150
      set -g status-right '#[fg=colour244]%Y/%m/%d(%a) %H:%M:%S '
      set -g message-style fg=white,bold,bg=red

      bind-key -nr M-Up resize-pane -U 5
      bind-key -nr M-Down resize-pane -D 5
      bind-key -nr M-Left resize-pane -L 5
      bind-key -nr M-Right resize-pane -R 5

      bind '"' split-window -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"

      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R
    '';
  };

  programs.ssh = {
    enable = true;
  };
}
