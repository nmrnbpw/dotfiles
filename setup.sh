#!/bin/sh

pushd ~
ln -s dotfiles/.tmux.conf
ln -s dotfiles/.vimrc
ln -s dotfiles/.zshrc
popd
