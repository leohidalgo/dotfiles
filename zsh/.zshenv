### curl
export PATH=$HOME/.homebrew/opt/curl/bin:$PATH

### fastlane
export FASTLANE_SKIP_UPDATE_CHECK=1
export FASTLANE_XCODEBUILD_SETTINGS_TIMEOUT=120

### gpg ssh
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$HOME/.gnupg/S.gpg-agent.ssh
export KEYID=10EDACC1B1D5E771B27E0244E841BA4BCB51C4E6

### homebrew
export HOMEBREW_BUNDLE_FILE=~/.brewfile
export HOMEBREW_BUNDLE_INSTALL_CLEANUP=1
export HOMEBREW_CASK_OPTS=--require-sha
export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_NO_AUTO_UPDATE=1

### pre-commit
export PRE_COMMIT_COLOR=never

### rust
. "$HOME/.cargo/env"

export CARGO_CARGO_NEW_VCS=none
export RUSTFLAGS="-A unused_imports -A unused_variables"

### java
export PATH="$HOME/.jenv/bin:$PATH"

### storybook
export STORYBOOK_DISABLE_TELEMETRY=1

### sublime
export PATH=/Applications/Sublime\ Text.app/Contents/SharedSupport/bin:$PATH

### utf8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

### clicolor
export CLICOLOR=1
export CLICOLOR_FORCE=1
export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=YES
export PURE_GIT_PULL=0
export EDITOR=vim

export WORDCHARS=' *?_-.[]~=&;!#$%^(){}<>/'
