### carthage
. $(brew --prefix)/share/zsh/site-functions/_carthage

### gpg ssh
gpgconf --launch gpg-agent

### zsh
FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

autoload -Uz compinit && compinit
autoload -Uz select-word-style

setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt autocd
setopt autopushd

select-word-style normal

zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
zstyle ':zle:*' word-style unspecified

. $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
. $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

### z
. $(brew --prefix)/etc/profile.d/z.sh

### pure
autoload -U promptinit; promptinit
prompt pure

### functions
up() {
    export git_dir="$(git rev-parse --show-toplevel 2> /dev/null)"

    if [ -z $git_dir ]
        then
        cd ..
    else
        cd $git_dir
    fi
}

openx() {
    if test -n "$(find . -maxdepth 1 -name '*.xcworkspace' -print -quit)"
    then
        echo "Opening workspace"
        open *.xcworkspace
        return
    else
        if test -n "$(find . -maxdepth 1 -name '*.xcodeproj' -print -quit)"
        then
            echo "Opening project"
            open *.xcodeproj
            return
        else
            echo "Nothing found"
        fi
    fi
}

opens() {
    if test -n "$(find . -maxdepth 1 -name '*.sublime-project' -print -quit)"
    then
        echo "Opening project"
        subl --project *.sublime-project
    else
        subl .
    fi
}

h() {
    if [ -z "$*" ]; then
        history 1
    else
        history 1 | egrep --color=auto "$@"
    fi
}

### load external files
[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases
[ -f ~/.zsh_keybinds ] && source ~/.zsh_keybinds
