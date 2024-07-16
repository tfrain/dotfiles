# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
	git
	github
	zsh-syntax-highlighting
	zsh-autosuggestions
	history-search-multi-word
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[[ ! -f ~/.bash_funcs ]] || source ~/.bash_funcs
[[ ! -f ~/.bash_aliases ]] || source ~/.bash_aliases

linux_export() {
  # Go
  export GOROOT=/usr/local/go
  export GOPATH=/home/wei/Code/go
  export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
  export GO111MODULE=on
  export GOPROXY=https://goproxy.cn
  # java
  # export JAVA_HOME=/home/wei/App/jdk1.8.0_191 
  # export CLASSPATH=/home/wei/App/jdk1.8.0_191/bin
  # export PATH=$PATH:$JAVA_HOME/bin:$CLASSPATH
  # protoc
  export PROTO=/home/travis
  export PATH=$PATH:$PROTO/bin:$PATH
  export PATH=$PATH:/home/wei/.local/bin:$PATH
  # rust
  export PATH="$HOME/.cargo/bin:$PATH"
}

macos_export() {
	# GO
  export GOPATH=$HOME/go
  export GOROOT="$(brew --prefix golang)/libexec"
  export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
  export GO111MODULE="auto"
  export PATH="/opt/homebrew/opt/curl/bin:$PATH"
  # For vscode
  export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
}

main() {
	# Editor
  export EDITOR="nvim"
  export GIT_EDITOR="nvim"
  export REACT_EDITOR="nvim"
  # History
  export HISTFILE="$HOME/.zsh_history"
  # Proxy
  # export http_proxy=socks5://127.0.0.1:10808
  # export https_proxy=socks5://127.0.0.1:10808
  osname=$(uname -sm)
  case "${osname}" in
		Linux*)
			linux_export;;
    Darwin*)
			macos_export;;
		*)
			echo "No available for ${osname}."
      ;;
  esac
}
main
