#!/bin/bash

# Install homebrew
if which brew > /dev/null; then
  echo "homebrew is already installed."
else
  echo "Installing homebrew."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew bundle install
fi

# Set $ZDOTDIR
if grep -q "export ZDOTDIR" $HOME/.zprofile; then
  echo "\$ZDOTDIR is already set"
else
  echo "export ZDOTDIR=$HOME/.config/zsh" >> $HOME/.zprofile
  echo "\$ZDOTDIR has been set to $ZDOTDIR"
fi

# Symlink configs to ~/.config
if [ -d $HOME/.config ]; then
  ln -s $(pwd)/*/ $HOME/.config
else
  mkdir $HOME/.config
  ln -s $(pwd)/*/ $HOME/.config
fi

