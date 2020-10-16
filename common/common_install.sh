#!/bin/bash

sh common/composer.sh
sh common/python.sh
sh common/typography.sh

# -------------------------------------------------------
# Install autocompletion for terraform
# -------------------------------------------------------
terraform -install-autocomplete

# -------------------------------------------------------
# Install node version manager
# -------------------------------------------------------
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash

# -------------------------------------------------------
# Install vim-plug
# -------------------------------------------------------
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# -------------------------------------------------------
# Install tmux tpm (plugin manager)
# -------------------------------------------------------
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# -------------------------------------------------------
# Change shell to ZSH
# -------------------------------------------------------
chsh -s /bin/zsh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# -------------------------------------------------------
# Copy dotfiles from this directory to home root
# -------------------------------------------------------
read -p "Do you wish to move dotfiles from this directory to home? (y/n)" $yn
if [ "$yn" == "y" ]
	then
		cp actual/.* ~/
	fi

# -------------------------------------------------------
# Neovim Configuration
# -------------------------------------------------------
read -p "Do you wish to install neovim init file? (y/n)" $yn
if [ "$yn" == "y" ]
	then
		mkdir ~/.config
		mkdir ~/.config/nvim
		cp neovim/init.vim ~/.config/nvim/init.vim
	fi