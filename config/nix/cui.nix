{
  pkgs,
  ...
}: {
  home = {
    packages = with pkgs; [
      p7zip
      unzip
      unrar
      dtrx
    ];
    file = {
      ".local/bin/s" = {
        executable = true;
        text = ''
#!/usr/bin/env sh

if test $# -eq 1 && test -f $1; then
  bat $1
  exit
fi

lsd -l $@
          '';
      };
    };
  };

  programs = {
    bat.enable = true;
    lsd.enable = true;

    direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv = {
        enable = true;
      };
    };

    ranger = {
      enable = true;
    };

    starship = {
      enable = true;
      settings = {
        add_newline = false;
        character = {
          success_symbol = "[➜](bold green) ";
          error_symbol = "[✗](bold red) ";
        };
        directory = {
          truncation_length = 1;
          fish_style_pwd_dir_length = 1;
          read_only = " ";
        };
        aws = { symbol = "  "; };
        conda = { symbol = " "; };
        dart = { symbol = " "; };
        docker_context = { symbol = " "; };
        elixir = { symbol = " "; };
        elm = { symbol = " "; };
        git_branch = { symbol = " "; };
        golang = { symbol = " "; };
        hg_branch = { symbol = " "; };
        java = { symbol = " "; };
        julia = { symbol = " "; };
        memory_usage = { symbol = " "; };
        nim = { symbol = " "; };
        nix_shell = { symbol = " "; };
        package = { symbol = " "; };
        perl = { symbol = " "; };
        php = { symbol = " "; };
        python = { symbol = " "; };
        ruby = { symbol = " "; };
        rust = { symbol = " "; };
        scala = { symbol = " "; };
        shlvl = { symbol = " "; };
        swift = { symbol = "ﯣ "; };
      };
    };

    bash = {
      enable = true;

      initExtra = ''
export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/.local/sbin"

CLANG_PATH=/usr/bin/clang
CLANGPP_PATH=/usr/bin/clang++

if [ -f $CLANG_PATH  ]; then
  export CC=$CLANG_PATH
fi
if [ -f $CLANGPP_PATH  ]; then
  export CXX=$CLANGPP_PATH
fi

export FZF_CTRL_T_OPTS="
  --preview 'bat --color=always --style=numbers --line-range=:500 {}'"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
if [ -d "$PYENV_ROOT" ] ; then
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
  eval "$(pyenv virtualenv-init -)"
fi
'';

      shellAliases = {
        cat = "bat";
        ls = "lsd";
        ll = "lsd -al";
        l = "lsd -l";
        v = "hx";
        vi = "hx";
        vim = "hx";
        r = "ranger";
        dtrx = "dtrx --one=inside";

        # flatpak things
        protontricks = "flatpak run com.github.Matoking.protontricks";
        protontricks-launch = "flatpak run --command=protontricks-launch com.github.Matoking.protontricks";
      };

      shellOptions = [
        "autocd"
        "cdable_vars"
        "checkhash"
        "checkjobs"
        "checkwinsize"
        "dirspell"
        "extglob"
        "globstar"
        "histappend"
      ];
    };

    fzf = {
      enable = true;
      enableBashIntegration = true;
    };

    helix = {
      enable = true;
      defaultEditor = true;
      settings = {
        theme = "base16_default_dark";
      };
    };
  };
}
