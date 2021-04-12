#!/bin/sh

echo "Installing Oh-My-Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Getting Spaceship..."
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
sed -i 's/robbyrussell/spaceship/g' $HOME/.zshrc

echo "Installing Zinit"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

echo 'zinit light zdharma/fast-syntax-highlighting' >> $HOME/.zshrc
echo 'zinit light zsh-users/zsh-autosuggestions' >> $HOME/.zshrc
echo 'zinit light zsh-users/zsh-completions' >> $HOME/.zshrc

clear
echo "Done, now restart your terminal for the final configuration."