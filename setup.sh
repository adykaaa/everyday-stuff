#!/bin/sh

#install zsh and ohmyzsh
sudo apt-get update && sudo apt-get install zsh curl wget -y && chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc

#start the zsh terminal
zsh

#install nodeJS v22
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
nvm install 22

#install neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim

#install nerdfont for NVIM
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Meslo.zip
mkdir -p ~/.local/share/fonts
unzip FiraCode.zip -d ~/.local/share/fonts
fc-cache -fv

#install lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep '"tag_name":' |  sed -E 's/.*"v*([^"]+)".*/\1/')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit && rm lazygit.tar.gz

#install utils
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    software-properties-common \
    apt-transport-https -y

#set up dependencies for vim
sudo apt-get install -y vim ripgrep python3 python3-pip python3-venv fzf
sudo npm install -g tree-sitter-cli

#install Go
wget https://go.dev/dl/go1.23.4.linux-amd64.tar.gz && \
  sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.23.4.linux-amd64.tar.gz && \
  echo "export PATH=$PATH:/usr/local/go/bin \n" >> ~/.zshrc && \
  echo "alias vim=nvim \n" >> ~/.zshrc
  source ~/.zshrc

#install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
. "$HOME/.cargo/env"
rustup component add rust-analyzer

#install Docker
wget -O docker-desktop-amd64.deb "https://desktop.docker.com/linux/main/amd64/docker-desktop-amd64.deb?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-linux-amd64"
sudo apt-get install ./docker-desktop-amd64.deb
systemctl --user enable docker-desktop

#install Warp
curl -sSL https://app.warp.dev/download/signing_key.pub | sudo gpg --dearmor --yes -o /usr/share/keyrings/warp-archive-keyring.gpg && echo "deb [signed-by=/usr/share/keyrings/warp-archive-keyring.gpg] https://app.warp.dev/pkg/deb stable main" | sudo tee /etc/apt/sources.list.d/warp.list > /dev/null && sudo apt update && sudo apt install warp-terminal

#install K3d
wget -q -O - https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
k3d cluster create local-cluster

#set Neovim config
cp -r nvim/ ~/.config/nvim

#start neovim
nvim .

#echo last instructions
echo "Set the font type to the nerdfont in Warp so that it can render nice graphics in Neovim!"
