#!/bin/bash

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
ln -s "$(dirname "$0")/Brewfile" "$HOME"
brew bundle install

# Set $ZDOTDIR
if grep -q "export ZDOTDIR" "$HOME/.zprofile"; then
  echo "\$ZDOTDIR is already set"
else
  echo "export ZDOTDIR=$HOME/.config/zsh" >> "$HOME/.zprofile"
  echo "\$ZDOTDIR has been set to $ZDOTDIR"
fi

# Symlink configs to ~/.config
mv "$(dirname "$0")" "$HOME/.dotfiles"
stow "$HOME/.dotfiles"

# Install colorz
pipx install colorz

# Install Pywalfox
pip3 install pywalfox
python3 -m pywalfox install

# Install walogram
git clone https://github.com/nikkoxd/walogram.git
(
  cd walogram || return
  sudo make install
  rm -r walogram
)
