# My Developer Setup - Win11/VScode/WSL2

This repository holds different config files and guides for my personal and opininated developer workstation setup. Main goal is to document the hours of troubleshooting and configuraion in a central space to make moving to a different machine less painfull over time.

# Windows 11 inital setup

System > Multitasking - Alt + Tab "Open windows only" <br>
For me personally the new default, that shows browser tabs with alt+tab, is super annoying. I have way to many tabs open and the setting reduces my ability to quickly swtich between windows.

## Install Tools with winget
I use winget for nearly all my tools/software installs as it allowes easy commandline updates for all everything. <br>
My process to figure out the correct IDs (to prevent installing random, unknown software) is to check what a package is with "winget search $NameOfSoftware" <br>
To install I use the following flags: <br>
"-e,--exact Find package using exact match" <br>
"--id Filter results by id" <br>

"winget install -e --id $ID"
IDs
- Microsoft.Edge.Dev
- Google.Chrome
- Mozilla.Firefox
- Postman.Postman
- Microsoft.Git
- Microsoft.GitCredentialManagerCore
- Microsoft.PowerShell
- DominikReichl.KeePass
- SlackTechnologies.Slack
- Spotify.Spotify

To update the whole set at once "winget upgrade --all"

## Install fonts
Depending on what setup your are going for, install either:

oh-my-zsh with powerline-go <br>
[Cascadia code with PL](https://github.com/microsoft/cascadia-code/releases) <br>
Download the latest release of Cascadia code and install CascadiaCodePL.ttf <br>
This version of the cascadia font contains Powerline icons. Without these, our zsh prompot would display cryptic glyphs.

oh-my-posh <br>
[Caskaydia Cove NF](https://github.com/ryanoasis/nerd-fonts/releases) <br>
For oh-my-posh we want to use the Nerd Font version of Cascadia Code called Caskaydia Cove. This Font contains a ton of unique icons for your powershell promt.
Download the latest release file from github. The file is just named "CascadiaCode.zip" and you want to install "Caskaydia Cove Nerd Font Complete.ttf" <br>

## Shell setup
- [install zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
- [install oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh/#basic-installation)
- [install github cli ](https://github.com/cli/cli/blob/trunk/docs/install_linux.md#debian-ubuntu-linux-raspberry-pi-os-apt)
- //optional: Setup work and personal git configs by following [this answer on stackoverflow](https://stackoverflow.com/a/43654115)
- modify default .zshrc and change the theme to agnoster in a first step. Most of the customizations at the end of this repos .zshrc need some more setup (go, powerline-go, zsh-plugins).
- create your custom.zsh file unter $HOME/.oh-my-zsh/custom and add exports under "General". Its also a good idea to new create your projects folder in $HOME and I also create a folger for my gocode $HOME/go. Enable aliases in custom.zsh that dont require other tools to be installed.

## Windows Terminal settings
- Set "Cascadia Code PL" or "CaskaydiaCove Nerd Font" as Font face in the Appearance tab under Settings/Profiles
- Set \\wsl$\Ubuntu\home\$USERNAME as starting directory

## VScode settings
To make sure VScode is also using our fonts I edit the editor.fontFamily setting. In addition I don't like the default autosuggestion function that adds suggestions on presing enter (I'm used to tab completion): 
````
"editor.fontFamily": "'Cascadia Code PL', 'CaskaydiaCove NF', Consolas, 'Courier New', monospace'",
"editor.acceptSuggestionOnEnter": "off"
````

## Go
````
curl -L --remote-name https://golang.org/dl/go1.17.2.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.17.2.linux-amd64.tar.gz
````
Now is a good time to add the Go specific exports to your custom.zsh. This adds $GOPATH and gobin to your path.

## Powerline go
- Install [powerline-go](https://github.com/justjanne/powerline-go#zsh) based on docs (install golang before)
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
