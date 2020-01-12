#!/bin/sh

pushd ~
ln -s dotfiles/.tmux.conf
ln -s dotfiles/.vimrc
ln -s dotfiles/.gvimrc
ln -s dotfiles/.zshrc
popd

git config --local user.name nmrnbpw
git config --local user.email n/a

