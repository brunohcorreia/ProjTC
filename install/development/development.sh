#!/bin/bash

yay -S --noconfirm --needed \
  cargo clang llvm mise \
  imagemagick \
  mariadb-libs postgresql-libs \
  github-cli \
  lazygit lazydocker-bin \
  tmux 

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm