# ls
alias ls="lsd"
alias ll="ls -l"
alias la="ls -a"
alias lt="ls --tree"
# tmux
alias t='tmux'
alias tn='t new -s'
alias ta='t attach -t'

# tools
alias lln="/usr/bin/ls -lhtr  --time-style long-iso | tac | cat -n | tac | sed -s 's/^\s*\([0-9]*\)\s*\(.*\)/[\1]  \2 [\1]/'g && pwd"
alias vi="nvim"
alias vima='vi ~/.bash_aliases;'
alias vimr='vi ~/.zshrc; source ~/.zshrc'
alias gia='vi ~/.oh-my-zsh/plugins/git/git.plugin.zsh'
alias vimn='vi ~/.cheat/note.txt'
alias viml='vi ~/.cheat/linux.md'
alias setproxy="export http_proxy=socks5://127.0.0.1:10808; export https_proxy=socks5://127.0.0.1:10808; echo 'HTTP Proxy on';"
alias unsetproxy="unset http_proxy; unset https_proxy; echo 'HTTP Proxy off';"
alias proxy="curl cip.cc"
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'


# help
alias h='tldr'
alias perf='sudo perf_5.3'
alias reload="source ~/.zshrc;"


alias nis="npm install --save "
alias mkcd='foo(){ mkdir -p "$1"; cd "$1" }; foo '
alias install='sudo apt get install'
alias update='sudo apt-get update; sudo apt-get upgrade'
alias ..="cd .."
alias ...="cd ..; cd .."
alias his='history'
alias ports='netstat -tulanp'
# alias rm='rm -I --preserve-root'
alias grep="grep --color"
alias grepp="grep -P --color"
