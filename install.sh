#!/bin/bash

export PATH=$PATH:/opt/homebrew/bin

# Clone the repository
if which git > /dev/null; then
  if [ -d "$(pwd)/dotfiles" ]; then
    echo "Repository has already been cloned."
  else
    echo "Cloning the repository..."
    git clone https://github.com/nikkoxd/dotfiles.git && cd dotfiles || exit
  fi
else
  echo "Git is not installed. Please install it first."
  exit 1
fi

# Install Homebrew
if which brew > /dev/null; then
  echo "Homebrew is already installed."
else
  echo "Installing Homebrew."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install Brew Bundle
echo "Installing Brew Bundle"
if [ -L "$HOME/Brewfile" ]; then
  mv "$HOME/Brewfile" "$HOME/Brewfile.backup"
  echo "Existing Brewfile moved to $HOME/Brewfile.backup"
fi
ln -s "$(pwd)/dotfiles/Brewfile" "$HOME"
brew bundle install

# Set $ZDOTDIR
if grep -q "export ZDOTDIR" "$HOME/.zprofile"; then
  echo "\$ZDOTDIR is already set"
else
  echo "export ZDOTDIR=$HOME/.config/zsh" >> "$HOME/.zprofile"
  echo "\$ZDOTDIR has been set to $ZDOTDIR"
fi

# Symlink configs to ~/.config
if [ -L "$HOME/Brewfile" ]; then
  rm "$HOME/Brewfile"
fi
if [ -L "$HOME/.dotfiles" ]; then
  mv "$(pwd)/dotfiles" "$HOME/.dotfiles"
fi
cd "$HOME/.dotfiles" || exit
stow --adopt .

# Install colorz
pipx install colorz

# Install Pywalfox
pipx install pywalfox
sudo pywalfox install --global

# Install walogram
cd "$HOME" || exit
git clone https://github.com/nikkoxd/walogram.git
(
  cd walogram || return
  sudo make install
)
rm -r walogram

