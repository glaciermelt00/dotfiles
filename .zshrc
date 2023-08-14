# ------------- Copy Kinugasa-san's settings
# Local
#export LANG=en_US.UTF-8
#export CLOUDSDK_PYTHON=python2

# PATH
export PATH=/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:${PATH}
# 2023/08/02 dircolors のため追加
export  PATH=/opt/homebrew/opt/coreutils/libexec/gnubin:${PATH}
#export PATH="/usr/local/opt/openssl@1.0/bin:$PATH"
#export PATH="/usr/local/opt/libpq/bin:$PATH"

# git
export PATH=/usr/local/Cellar/git/2.39.1/bin:$PATH
# Terminal
#export PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
# git-promptの読み込み
#source ~/.zsh/git-prompt.sh
# git-completionの読み込み
#fpath=(~/.zsh $fpath)
#zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
autoload -Uz compinit && compinit
# プロンプトのオプション表示設定
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto
# プロンプトの表示設定(好きなようにカスタマイズ可)
setopt PROMPT_SUBST ; PS1='%F{green}%n@%f: %F{cyan}%B%~%b%f %F{yellow}%B$(__git_ps1 "(%s)")%b%f
\$ '

export JAVA_HOME="/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home/"

# enable color support of ls and also add handy aliases
test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
# エラーが出るため、コメントアウト
# alias ls='ls --g --color=auto'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

eval `tset -s xterm-256color`

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
export COURSIER_TTL=1s

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"
# 2023/08/02 nvm 用に追加
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
#export NVM_DIR=~/.nvm
#source $(brew --prefix nvm)/nvm.sh

# Use node lts/hydrogen as default
nvm alias default lts/hydrogen
nvm use default > /dev/null 2>&1

# for node v18
export NODE_OPTIONS=--openssl-legacy-provider

# Command
alias screen='/usr/local/Cellar/screenutf8/4.8.0/bin/screen'
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'

# MySQL
export PATH=/usr/local/opt/mysql@5.7/bin:$PATH
export LDFLAGS="-L/usr/local/opt/mysql@5.7/lib"
export CPPFLAGS="-I/usr/local/opt/mysql@5.7/include"

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/__tabtab.bash ] && . ~/.config/tabtab/__tabtab.bash || true

# Added by serverless binary installer
export PATH="$HOME/.serverless/bin:$PATH"


eval "$(pyenv init --path)"

# Path
path=(
    /usr/local/opt/coreutils/libexec/gnubin(N-/) # coreutils
    /usr/local/opt/ed/libexec/gnubin(N-/) # ed
    /usr/local/opt/findutils/libexec/gnubin(N-/) # findutils
    /usr/local/opt/gnu-sed/libexec/gnubin(N-/) # sed
    /usr/local/opt/gnu-tar/libexec/gnubin(N-/) # tar
    /usr/local/opt/grep/libexec/gnubin(N-/) # grep
    ${path}
)

# Manual
manpath=(
    /usr/local/opt/coreutils/libexec/gnuman(N-/) # coreutils
    /usr/local/opt/ed/libexec/gnuman(N-/) # ed
    /usr/local/opt/findutils/libexec/gnuman(N-/) # findutils
    /usr/local/opt/gnu-sed/libexec/gnuman(N-/) # sed
    /usr/local/opt/gnu-tar/libexec/gnuman(N-/) # tar
    /usr/local/opt/grep/libexec/gnuman(N-/) # grep
    ${manpath}
)

# pipx path
export PATH="$PATH:/Users/haradajou/.local/bin"

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

#----------------------------------------------------------------------------
# for zsh-completions and autosuggestions
if type brew &>/dev/null; then
  zinit light zsh-users/zsh-completions
  zinit light zsh-users/zsh-autosuggestions
  #FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  source $(brew --prefix)/opt/zsh-git-prompt/zshrc.sh
  #source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  autoload -Uz compinit
  compinit
fi

autoload -Uz colors && colors

git_prompt() {
  if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = true ]; then
    PROMPT='%F{083}%n%f %F{038}($(arch))%f:%F{014}%B%~%f $(git_super_status)\$ '
  else
    PROMPT='%F{083}%n%f %F{038}($(arch))%f:%F{014}%B%~%f '
  fi
}

precmd() {
  git_prompt
}
#----------------------------------------------------------------------------

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Move to specified directory
cd /Volumes/dev/git-dev

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

## ecsログイン
alias ecsd='aws ecs execute-command --cluster platform-db-manager-development --container rails --interactive --command "/bin/sh" --task'
alias ecss='aws ecs execute-command --cluster platform-db-manager-staging --container rails --interactive --command "/bin/sh" --task'
alias ecsp='aws ecs execute-command --cluster platform-db-manager-production --container rails --interactive --command "/bin/sh" --task'
