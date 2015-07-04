#!/bin/bash

source ./config/header.sh

echo "Creating symlinks..."

ln -snf "$PWD"/terminal/.bash_profile ~/.bash_profile
ln -snf "$PWD"/terminal/bash ~/.bash

ln -snf "$PWD"/terminal/.vimrc ~/.vimrc
ln -snf "$PWD"/terminal/.gitconfig ~/.gitconfig

mkdir -p ~/.ssh
ln -snf "$PWD"/ssh/config ~/.ssh/config
