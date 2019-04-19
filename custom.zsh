alias p="$HOME/projects"
alias g="$HOME/go"
alias h="history"
alias kx="kubectx"
alias kn="kubens"
alias pwsh=powershell
alias zshconfig="vim ~/.zshrc"
alias zshcustom="vim ~/.oh-my-zsh/custom/custom.zsh"

zshreload() {
    source ~/.zshrc
}

export DEFAULT_USER="`whoami`"
#export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
export PATH="$PATH:`yarn global bin`"
export GPG_TTY=$(tty)

source /opt/az/bin/az.completion.sh
source <(kubectl completion zsh)
source <(minikube completion zsh)
source <(helm completion zsh)
#complete -o nospace -C /opt/terraform/terraform terraform