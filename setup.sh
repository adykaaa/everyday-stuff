#!/bin/sh

#installing zsh and ohmyzsh
sudo apt-get update && apt-get install zsh curl -y && chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo apt-get install terminator

#installing docker
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    apt-transport-https -y

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update && sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

#installing kubernetes
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update && sudo apt-get install -y kubectl && echo "source <(kubectl completion zsh)" >> ~/.zshrc

#setting up dependencies for vim
sudo apt-get install -y nodejs npm ripgrep python3 python3-pip python3-venv wget
sudo npm cache clean -f && sudo npm install -g n && sudo n stable && sudo npm install --global yarn
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


#Installing latest go version
wget https://go.dev/dl/go1.19.linux-amd64.tar.gz && \
  sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.19.linux-amd64.tar.gz && \
  echo "export PATH=$PATH:/usr/local/go/bin \n" >> ~/.zshrc && \
  echo "export TERM=xterm-256color \n" >> ~/.zshrc && \
  source ~/.zshrc

echo "open vim and do PlugInstall, CocInstall coc-pyright, CocInstall coc-tsserver, CocInstall coc-go"
