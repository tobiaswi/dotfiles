# My Developer Setup - Win11/VScode/WSL2

This repository holds different config files and guides for my personal and opininated developer workstation setup. Main goal is to document the hours of troubleshooting and configuraion in a central space to make moving to a different machine less painfull over time.

# Windows 11 inital setup

<b> Alt+Tab Behaviour</b><br>
System > Multitasking - Alt + Tab "Open windows only"<br>
For me personally the new default, that shows browser tabs with alt+tab, is super annoying. I have way to many tabs open and the setting reduces my ability to quickly swtich between windows.

<b>Web search results</b><br>
One of the most intrusive and disgusting changes in windows 11. Even when everything within windows settings regarding web+bing search is disabled, it STILL searches web content when you press the windows key and type something it doesnt find on your machine. The event that drove me to find this solution was WinKey -> type: 24*9, suddenly I had a video autoplaying in my native windows search about some football game. Maybe its really time to swap back to native Linux or get a Mac<br>
Disable it by:<br>
Regedit -> "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows" -> New Key: "Explorer" -> New DOWRD (32bit): "DisableSearchBoxSuggestions" -> Set value to 1.


## Install Tools with winget
I use winget for nearly all my tools/software installs as it allowes easy commandline updates for all everything.
My process to figure out the correct IDs (to prevent installing random, unknown software) is to check what a package is with:
```
winget search $NameOfSoftware"
````
To install I use the following flags: <br>
"-e,--exact Find package using exact match" <br>
"--id Filter results by id" <br>
```
winget install -e --id $ID"
```
These are my core installs:
- Microsoft.Edge.Dev
- Google.Chrome
- Mozilla.Firefox
- Postman.Postman
- Microsoft.Git
- Microsoft.GitCredentialManagerCore
- Microsoft.PowerShell
- Obsidian.Obsidian
- AgileBits.1Password
- SlackTechnologies.Slack
- Spotify.Spotify

To update everythin in one go:
```
winget upgrade --all
```

## Install fonts
Depending on what setup your are going for, install either:

oh-my-zsh with powerline-go <br>
[Cascadia code with PL](https://github.com/microsoft/cascadia-code/releases) <br>
Download the latest release of Cascadia code and install CascadiaCodePL.ttf <br>
This version of the cascadia font contains Powerline icons. Without these, our zsh prompot would display cryptic glyphs.

oh-my-posh<br>
[Caskaydia Cove NF](https://github.com/ryanoasis/nerd-fonts/releases) <br>
For oh-my-posh we want to use the Nerd Font version of Cascadia Code called Caskaydia Cove. This Font contains a ton of unique icons for your powershell promt.
Download the latest release file from github. The file is just named "CascadiaCode.zip" and you want to install "Caskaydia Cove Nerd Font Complete.ttf" <br>
My starting point where for oh-my-posh was [Scotts' blog](https://www.hanselman.com/blog/my-ultimate-powershell-prompt-with-oh-my-posh-and-the-windows-terminal)

//note: as of recently (at the time of the latest commit I'm on build 22622.440), oh-my-posh doesn't load anymore. It complains that my PowerShell_profile.ps1 can't be loaded as its not signed. It was never signed before so I expect this to be a behaviour that was recently enabled.

## Shell setup
- [install zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
- [install oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh/#basic-installation)
- [install github cli ](https://github.com/cli/cli/blob/trunk/docs/install_linux.md#debian-ubuntu-linux-raspberry-pi-os-apt)
- //optional: Setup work and personal git configs by following [this answer on stackoverflow](https://stackoverflow.com/a/43654115)
- modify default .zshrc and change the theme to agnoster in a first step. Most of the customizations enabled in the .zshrc in this repo, need additonal setup or you will get errors when starting your shell (go, powerline-go, zsh-plugins).
- create your custom.zsh file unter $HOME/.oh-my-zsh/custom and add exports under "General". Now it's also a good idea to create your "projects" folder in $HOME. In the same step I create a folder for my gocode $HOME/go.

After that, enable aliases in custom.zsh that dont require other tools to be installed.

## Windows Terminal settings
A lot of work has been done for Windows Terminal since the inception of this repo. My Terminal settings are now incluided in this repo.<br>
Be carefull to not straight up copy & paste it. You might need to generate new profile IDs and make sure that commandLine statements match your setup. Terminal now has build in auto-detection for installed Linux distributions, I recommend only adding snippets from my config if required.

# VScode

## Custom settings
To make sure VScode is also using our fonts I edit the editor.fontFamily setting. In addition I don't like the default autosuggestion function that adds suggestions on presing enter (I'm used to tab completion): 
````
"editor.fontFamily": "'Cascadia Code PL', 'CaskaydiaCove NF', Consolas, 'Courier New', monospace'",
"editor.acceptSuggestionOnEnter": "off"
````

## Extensions

### My Essentials
make things look nice:
- Material Icon Theme
- One Dark Pro

make working better:
- Remote - WSL
- EditorConfig for VS Code
- Go
- Kubernetes
- Docker
- Kind
- HashiCorp Terraform
- tfsec
- Trivy Vulnerability Scanner
- YAML
- PowerShell
- Azure Account
- Azure CLI Tools

### New stuff
- Remote - Containers
- GitHub Codespaces
- GitHub Pull Requests and Issues
- GitHub Repositories
- GitHub Copilot
- GitHub Copilot Labs


# Dev Landscape (YMMV)

## Go
````
curl -L --remote-name https://go.dev/dl/go1.18.4.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.18.4.linux-amd64.tar.gz
````
Now is a good time to add the Go specific exports to your custom.zsh. This adds $GOPATH and gobin to your path.

## Powerline go
- Install [powerline-go](https://github.com/justjanne/powerline-go#zsh) based on docs (install golang before)
- powerline-go settings are in the .zshrc file in this repo

# Rust

# Python

# .NET


# Shell setup
- [install zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
- [install oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh/#basic-installation)
- [install github cli ](https://github.com/cli/cli/blob/trunk/docs/install_linux.md#debian-ubuntu-linux-raspberry-pi-os-apt)
- //optional: Setup work and personal git configs by following [this answer on stackoverflow](https://stackoverflow.com/a/43654115)
- modify default .zshrc and change the theme to agnoster in a first step. Most of the customizations at the end of this repos .zshrc need some more setup (go, powerline-go, zsh-plugins).
- create your custom.zsh file unter $HOME/.oh-my-zsh/custom and add exports under "General". Its also a good idea to new create your projects folder in $HOME and I also create a folger for my gocode $HOME/go. Enable aliases in custom.zsh that dont require other tools to be installed.

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

# Docker
## Docker Engine (we dont need Desktop!)
Following this installation guide: https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository
## Docker Credential Helper
We'll install the DBUS based secret service to avoid storing our token in plaintext in ~/.docker/config.json
[docker-credential-helpers](https://github.com/docker/docker-credential-helpers)
```
curl -L --fail --remote-name https://github.com/docker/docker-credential-helpers/releases/download/v0.6.4/docker-credential-secretservice-v0.6.4-amd64.tar.gz
tar -zxvf docker-credential-secretservice-v0.6.4-amd64.tar.gz
sudo mkdir -p /opt/docker-credential-secretservice && sudo mv docker-credential-secretservice $_ && \
[ ! -f /usr/local/bin/docker-credential-secretservice ] && \
sudo ln -s /opt/docker-credential-secretservice/docker-credential-secretservice /usr/local/bin/docker-credential-secretservice
```
Docker config file ~/.docker/config.json
This will require that you set a password on your ubuntu gnome keyring (you get a popup once you run docker login with this config)
```
{
        "auths": {
                "https://index.docker.io/v1/": {}
        },
        "credsStore": "secretservice"
}
```


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
curl -L --remote-name-all https://get.helm.sh/helm-v3.9.2-linux-amd64.tar.gz{,.sha256sum}
sha256sum --check helm-v3.9.2-linux-amd64.tar.gz.sha256sum
sudo tar -zxvf helm-v3.9.2-linux-amd64.tar.gz
sudo mkdir -p /opt/helm && sudo cp linux-amd64/helm $_ && [ ! -f /usr/local/bin/helm ] && sudo ln -s /opt/helm/helm /usr/local/bin/helm && [ -d ./linux-amd64 ] && sudo rm -rf linux-amd64
rm helm-v3.9.2-linux-amd64.tar.gz{,.sha256sum}
````

## k9s
````
curl -L --remote-name https://github.com/derailed/k9s/releases/download/v0.26.0/k9s_Linux_x86_64.tar.gz
sudo mkdir /opt/k9s
sudo tar -zxvf k9s_Linux_x86_64.tar.gz
sudo mv k9s /opt/k9s/k9s
sudo ln -s /opt/k9s/k9s /usr/local/bin
rm k9s_Linux_x86_64.tar.gz
````

## Kind
```
go install sigs.k8s.io/kind@v0.14.0
```

## Cilium
To make Cilium work for WSL2 Ubuntu 20.04 you need to complie your own kernel:
https://harthoover.com/compiling-your-own-wsl2-kernel/

https://docs.cilium.io/en/stable/gettingstarted/k8s-install-default/#install-the-cilium-cli
https://docs.cilium.io/en/stable/gettingstarted/hubble_setup/#install-the-hubble-client

## Tetragon
Currently not working. While the latest WSL2 kernel has most BPF related flags active, there is one important missing:
CONFIG_IKHEADERS=y
Trying to compile a custom kernel with ikheaers enabled fails.<br>
For now it looks like WSL + Kind doesn't work for local dev with Tetragon. I will either try using VSCode remote container or ssh into a true linux box.

# Azure
## Cli
https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt#option-2-step-by-step-installation-instructions

how to fix az autocompletion:
"/opt/az/bin/az.completion.sh:11: command not found: register-python-argcomplete"
```
sudo apt install python3-pip
pip3 install argcomplete
sudo apt install python3-argcomplete
export python bin to path so azure cli can find argcomplete
export PATH="${PATH}:$(python3 -c 'import site; print(site.USER_BASE)')/bin"
```

## Azure Kubelogin
When working with AKS and aad identities you will need to install and use kubelogin to convert your kubeconfig that allows using your azure cli auth token. This is especially important if your org requies compliant devices and MFA to login to AAD.
[Azure/kubelogin](https://github.com/Azure/kubelogin)
```
curl -L --remote-name-all https://github.com/Azure/kubelogin/releases/download/v0.0.18/kubelogin-linux-amd64.zip{,.sha256}
sha256sum --check kubelogin-linux-amd64.zip.sha256 && TEMP_DIR=$(mktemp -d) && unzip kubelogin-linux-amd64.zip -d $TEMP_DIR
if [ ! -d /opt/kubelogin ]; then sudo mkdir -p /opt/kubelogin; fi && sudo mv $TEMP_DIR/bin/linux_amd64/kubelogin /opt/kubelogin/kubelogin && sudo chown -R root:root /opt/kubelogin
if [ ! -f /usr/local/bin/kubelogin ] ; then sudo ln -s /opt/kubelogin/kubelogin /usr/local/bin/kubelogin ; fi
rm -r /bin kubelogin-kubelogin-linux-amd64.zip{,.sha256}
```

# Terraform

## Installation
required
````
sudo apt install unzip
````
Download and install the latest terraform version but follow hashicorps guide on verifiying the downloaded terraform binary. This is super important for tools that have such high impact.
[Verify Terraform Binary Archives](https://learn.hashicorp.com/tutorials/terraform/verify-archive?in=terraform/cli)

## tfsec
simple way using go:
```
go install github.com/aquasecurity/tfsec/cmd/tfsec@latest
```