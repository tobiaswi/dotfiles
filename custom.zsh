# Custom aliases
alias p="$HOME/projects"
alias g="$HOME/go"
alias h="history"
alias k="kubectl"
alias kx="kubectx"
alias kn="kubens"
alias zshconfig="vim ~/.zshrc"
alias zshcustom="vim ~/.oh-my-zsh/custom/custom.zsh"
#alias nodejs=node
alias cd..='cd ..'
alias l='ls -lF'
alias ls='ls --color'
alias la='ls -lah'
alias grep='grep --color'

zshreload() {
    source ~/.zshrc
}

# General
export PROJECTPATH=$HOME/projects
export LS_COLORS="ow=01;36;40"
export DEFAULT_USER="`whoami`"

# Go
export GOPATH=$PROJECTPATH/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

## JavaScript
#export PATH="$PATH:`yarn global bin`"

## .NET
#export DOTNET_CLI_TELEMETRY_OPTOUT="1"

# GPG
export GPG_TTY=$(tty)
export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
gpg-connect-agent updatestartuptty /bye

# Autocompletion
source /opt/az/bin/az.completion.sh
source <(kubectl completion zsh)
complete -F __start_kubectl k
source <(minikube completion zsh)
source <(helm completion zsh)
#complete -C /opt/terraform/terraform terraform