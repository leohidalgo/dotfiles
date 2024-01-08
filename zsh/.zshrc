### utf8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

### homebrew
eval "$(~/.homebrew/bin/brew shellenv)"
export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_CASK_OPTS=--require-sha

## carthage
. $(brew --prefix)/share/zsh/site-functions/_carthage

### sublime
export PATH=/Applications/Sublime\ Text.app/Contents/SharedSupport/bin:$PATH

### fastlane
export FASTLANE_SKIP_UPDATE_CHECK=1
export FASTLANE_XCODEBUILD_SETTINGS_TIMEOUT=120
. ~/.fastlane/completions/completion.zsh

### gpg ssh
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=/Users/leohidalgo/.gnupg/S.gpg-agent.ssh
export KEYID=10EDACC1B1D5E771B27E0244E841BA4BCB51C4E6
gpgconf --launch gpg-agent

### rbenv
eval "$(rbenv init -)"

### nodenv
eval "$(nodenv init -)"

### pyenv
eval "$(pyenv init -)"

### Storybook
export STORYBOOK_DISABLE_TELEMETRY=1

### pre-commit
export PRE_COMMIT_COLOR=never

### rust
export RUSTFLAGS="-A unused_imports -A unused_variables"
export RUST_BACKTRACE=1

### 1password
source /Users/leohidalgo/.config/op/plugins.sh

# oh my zsh
export ZSH="/Users/leohidalgo/.oh-my-zsh"
export ZSH_THEME="agnoster"
export ZSH_DISABLE_COMPFIX=true

source $ZSH/oh-my-zsh.sh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

### alias
alias d="du -d1 -hc"
alias g="gittower ."
alias o="open ."
alias s="subl ."
alias ll="ls -laGh"
alias fl="be fastlane"
alias be="bundle exec"
alias bi="bundle install"
alias bu="bundle update"
alias dash="open dash://"
alias bz="bazel"
alias pd="podman"
alias k8s="kubectl"
alias pc="podman-compose"

### z
. $(brew --prefix)/etc/profile.d/z.sh

### ngrok
if command -v ngrok &>/dev/null; then
    eval "$(ngrok completion)"
fi

### powerline-shell
function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
    for s in "${precmd_functions[@]}"; do
        if [ "$s" = "powerline_precmd" ]; then
            return
        fi
    done

    precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" -a -x "$(command -v powerline-shell)" ]; then
    install_powerline_precmd
fi

up() {
    export git_dir="$(git rev-parse --show-toplevel 2> /dev/null)"

    if [ -z $git_dir ]
        then
        cd ..
    else
        cd $git_dir
    fi
}

git_update_all() {
    current_branch="$(git symbolic-ref --short HEAD)"

    if [ "$current_branch" != "develop" ]; then
        echo "Checkout branch develop first"
        return
    fi

    for branch in $(git branch);
    do
        git checkout $branch
        git rebase remotes/origin/develop
        echo ""
    done

    git checkout develop
}

### xcode via @orta
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
