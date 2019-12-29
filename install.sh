#!/bin/bash

sudo yum install zsh vim tmux git -y

pushd ~
  git clone https://github.com/nmrnbpw/dotfiles
  pushd dotfiles
    sh setup.sh
  popd
popd

