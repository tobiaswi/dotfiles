# My Developer Setup - Win11/VScode/WSL2

This repository holds different config files and guides for my personal and opininated developer workstation setup. Main goal is to document the hours of troubleshooting and configuraion in a central space to make moving to a different machine less painfull over time.

## Install ZSH
- install zsh
- install oh-my-zsh
- modify .zshrc
- custom.zsh

## Install fonts
- Cascadia code with PL
- Caskaydia Cove NF

## Windows Terminal settings
- Set Cascadia Code PL font in WSL profile \
- Set //wsl$/Ubuntu/home/tobiaswi as starting directory

## VScode settings
- Set Cascadia Code as VScode font \
- Same setting for for remote wsl
````
"terminal.integrated.fontFamily": "'Cascadia Code PL'"
````

- Disable autossuggestions on enter:\
https://i.imgur.com/EAkDgno.png

## Powerline go
- Install powerline-go based on docs (install golang before)
https://github.com/justjanne/powerline-go#zsh
- powerline-go settings are in the .zshrc file in this repo


## ZSH plugins
Beside the default installed plugins you can get some very usefull/productive ones from the [zsh-users repository](https://github.com/zsh-users)

Plugins I use:

- [zsh-completions](https://github.com/zsh-users/zsh-completions)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md)
- [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
````
#!/bin/bash
for i in 'completions' 'autosuggestions' 'history-substring-search' 'syntax-highlighting'
do
     git clone https://github.com/zsh-users/zsh-$i ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-$i
done

````
syntax highlighting comes with a regressing reload timer when running zshreload in the same shell. dont reload to often in a single shell and your good. If reload takes 5-10sec+, close current shell and start a new one. Don't know whats the source of this but searching for the issue takes way longer than just opening a new one :-)

# Kubernetes 
## kubectl 
````
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl
````
make sure it doesnt auto update so we dont get issues with lower api versions.
````
sudo apt-mark hold kubectl
````
To update kubectl just run
````
sudo apt upgrade kubectl
````

## helm
````
curl -L --remote-name https://get.helm.sh/helm-v3.7.0-linux-amd64.tar.gz{,.sha256sum}
sha256sum --check helm-v3.7.0-linux-amd64.tar.gz.sha256sum
sudo tar -zxvf helm-v3.7.0-linux-amd64.tar.gz /usr/local/bin
rm helm-v3.7.0-linux-amd64.tar.gz{,.sha256sum}
````

## k9s
````
curl -L --remote-name https://github.com/derailed/k9s/releases/download/v0.24.15/k9s_Linux_x86_64.tar.gz
sudo mkdir /opt/k9s
sudo tar -zxvf k9s_Linux_x86_64.tar.gz
sudo mv k9s /opt/k9s/k9s
sudo ln -s /opt/k9s/k9s /usr/local/bin
rm k9s_Linux_x86_64.tar.gz
````

# Azure
## install cli
https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt#option-2-step-by-step-installation-instructions

how to fix az autocompletion:
"/opt/az/bin/az.completion.sh:11: command not found: register-python-argcomplete"
````
sudo apt install python3-pip
pip3 install argcomplete
sudo apt install python3-argcomplete
export python bin to path so azure cli can find argcomplete
export PATH="${PATH}:$(python3 -c 'import site; print(site.USER_BASE)')/bin"
````

# Terraform
## install unzip first
````
sudo apt install unzip
````
## download tf and move to location on path
````
curl -L --remote-name https://releases.hashicorp.com/terraform/1.0.7/terraform_1.0.7_linux_amd64.zip
unzip terraform_1.0.7_linux_amd64.zip
sudo mv terraform /usr/local/bin/
rm terraform_1.0.7_linux_amd64.zip
````

# Keybase
````
curl -L --remote-name https://prerelease.keybase.io/keybase_amd64.deb
sudo apt install ./keybase_amd64.deb
rm keybase_amd64.deb
````

# Git Credential Manager Core - gcmcore
````
curl -L --remote-name https://github.com/microsoft/Git-Credential-Manager-Core/releases/download/v2.0.498/gcmcore-linux_amd64.2.0.498.54650.deb
sudo dpkg -i ./gcmcore-linux_amd64.2.0.498.54650.deb
rm gcmcore-linux_amd64.2.0.498.54650.deb
````