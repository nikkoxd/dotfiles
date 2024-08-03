#!/bin/bash

if which brew > /dev/null; then
  echo "homebrew is already installed."
else
  echo "Installing homebrew."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew bundle install
fi


