#!/bin/sh

#installing zsh and ohmyzsh
sudo apt-get update && apt-get install zsh curl -y && chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo apt-get install wget terminator -y

#Installing nerdfont for NVIM
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
mkdir -p ~/.local/share/fonts
unzip FiraCode.zip -d ~/.local/share/fonts
fc-cache -fv

#installing docker
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    software-properties-common \
    apt-transport-https -y

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update && sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
sudo groupadd docker && sudo usermod -aG docker $USER && sudo chown $USER /var/run/docker.sock
sudo systemctl enable docker.service && sudo systemctl enable containerd.service
sudo chmod 777 /usr/var/docker.sock


#installing kubernetes
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update && sudo apt-get install -y kubectl && echo "source <(kubectl completion zsh)" >> ~/.zshrc

#setting up dependencies for vim
sudo apt-get install -y vim nodejs npm ripgrep python3 python3-pip python3-venv 



sudo npm cache clean -f && sudo npm install -g n && sudo n stable && sudo npm install --global yarn && sudo npm -g install create-react-app
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


#installing Go 1.19
wget https://go.dev/dl/go1.19.linux-amd64.tar.gz && \
  sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.19.linux-amd64.tar.gz && \
  echo "export PATH=$PATH:/usr/local/go/bin \n" >> ~/.zshrc && \
  echo "export TERM=xterm-256color \n" >> ~/.zshrc && \
  source ~/.zshrc

#installing terraform and ansible
wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
gpg --no-default-keyring \
    --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    --fingerprint
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt-get install terraform -y
python3 -m pip install --user ansible

#installing K3d
wget -q -O - https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
k3d cluster create local-cluster
echo " \n \n \n ==== Copy .vimrc from the repo, then open vim and do PlugInstall, CocInstall coc-pyright, CocInstall coc-tsserver, CocInstall coc-go, :GoInstallBinaries ===="
