alias p="$HOME/projects"
alias g="$HOME/go"
alias h="history"
alias kx="kubectx"
alias kn="kubens"
alias zshconfig="vim ~/.zshrc"
alias zshcustom="vim ~/.oh-my-zsh/custom/custom.zsh"

zshreload() {
    source ~/.zshrc
}

export DEFAULT_USER="`whoami`"
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
export PATH="$PATH:`yarn global bin`"
export GPG_TTY=$(tty)
export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
gpg-connect-agent updatestartuptty /bye

source /opt/az/bin/az.completion.sh
source <(kubectl completion zsh)
source <(minikube completion zsh)
source <(helm completion zsh)