#!/bin/bash

set -e

printf "🚀 Starting setup...\n"

if ! command -v brew &>/dev/null; then
  printf "🍺 Installing Homebrew...\n"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

brew update

printf "📦 Installing tools...\n"
brew install git stow kitty neovim

printf "🔡 Installing fonts...\n"
brew install --cask font-jetbrains-mono-nerd-font

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  printf "🐚 Installing Oh My Zsh...\n"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

printf "🔗 Linking dotfiles...\n"
cd ~/dotfiles-main
stow zsh kitty nvim

printf "✅ Setup complete. Please restart Kitty.\n"
