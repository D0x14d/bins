#!/bin/bash


echo -e "\033[1;31mInstalling ohmyzsh plugins\e[0m"

git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
git clone https://github.com/a0x14D/zsh-autocomplete.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
git clone https://github.com/wintermi/zsh-lsd.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-lsd"

echo -e "\033[1;31mAdding pluggins .zshrc \e[0m" 

sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-autocomplete  zsh-syntax-highlighting zsh-lsd )/g' $HOME/.zshrc


