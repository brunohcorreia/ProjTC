#!/bin/bash

# Use dark mode for QT apps too (like kdenlive)
if ! yay -Q kvantum-qt5 &>/dev/null; then
  yay -S --noconfirm kvantum-qt5
fi

# Prefer dark mode everything
if ! yay -Q gnome-themes-extra &>/dev/null; then
  yay -S --noconfirm gnome-themes-extra # Adds Adwaita-dark theme
fi

gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"

# Setup theme links
mkdir -p ~/.config/projtc/themes
for f in ~/.local/share/projtc/themes/*; do ln -nfs "$f" ~/.config/projtc/themes/; done

# Set initial theme
mkdir -p ~/.config/projtc/current
ln -snf ~/.config/projtc/themes/tokyo-night ~/.config/projtc/current/theme
ln -snf ~/.config/projtc/current/theme/backgrounds/1-scenery-pink-lakeside-sunset-lake-landscape-scenic-panorama-7680x3215-144.png ~/.config/projtc/current/background

# Set specific app links for current theme
ln -snf ~/.config/projtc/current/theme/neovim.lua ~/.config/nvim/lua/plugins/theme.lua

mkdir -p ~/.config/btop/themes
ln -snf ~/.config/projtc/current/theme/btop.theme ~/.config/btop/themes/current.theme

mkdir -p ~/.config/dunst
ln -snf ~/.config/projtc/current/theme/dunst.ini ~/.config/dunst/config

#Adicionar mais apps aqui
