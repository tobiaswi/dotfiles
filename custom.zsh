#####################################################################
# Alias
#####################################################################

## zsh easy of use
alias zshconfig="vim ~/.zshrc"
alias zshcustom="vim ~/.oh-my-zsh/custom/custom.zsh"

## beeing lazy
alias p="$HOME/projects"
alias g="$HOME/go"
alias h="history"
alias tf="terraform"
alias kx="kubectl ctx"
alias kn="kubectl ns"

## optional comfort
alias node=nodejs

#####################################################################
# Environment
#####################################################################

## Zsh
# shortening agnoster theme promt
export DEFAULT_USER="`whoami`"
export LS_COLORS="ow=01;36;40"
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"

## Kubernetes
export KUBECONFIG=$HOME/.kube/config
export KREW_ROOT=$HOME/.krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

## Go
export GOPATH=$HOME/go
export PATH="$PATH:/usr/local/go/bin:$GOPATH/bin"

## JavaScript Tooling
export PATH="$PATH:`yarn global bin`"

## .NET
export PATH="$PATH:$HOME/.dotnet/tools"
export DOTNET_CLI_TELEMETRY_OPTOUT="1"

## Rust
export PATH=$PATH:$HOME/.cargo/bin

## Phyton
export PATH="${PATH}:$(python3 -c 'import site; print(site.USER_BASE)')/bin"

## GPG and SSH
export GPG_TTY=$(tty)
source $HOME/.gpg4wsl #install required windows software first!

#####################################################################
# Auto Completion
#####################################################################

## Kubernetes & Co.
[[ /usr/bin/kubectl ]] && source <(kubectl completion zsh)
complete -F __start_kubectl k
source <(helm completion zsh)

## Terraform
complete -C /opt/terraform/terraform terraform

## Azure
source /opt/az/bin/az.completion.sh