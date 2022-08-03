
# ------------- Copy Kinugasa-san's settings
# Local
#export LANG=en_US.UTF-8
#export CLOUDSDK_PYTHON=python2

# PATH
export PATH=/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:${PATH}
#export PATH="/usr/local/opt/openssl@1.0/bin:$PATH"
#export PATH="/usr/local/opt/libpq/bin:$PATH"

# Terminal
#export PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
# git-promptの読み込み
source ~/.zsh/git-prompt.sh
# git-completionの読み込み
fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
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
alias ls='ls --g --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

eval `tset -s xterm-256color`

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
export COURSIER_TTL=1s

# nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

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

