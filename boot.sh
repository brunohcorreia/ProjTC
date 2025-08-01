#!/bin/bash

ansi_art='
   ▄███████▄    ▄████████  ▄██████▄       ▄█     ███      ▄████████ 
  ███    ███   ███    ███ ███    ███     ███ ▀█████████▄ ███    ███ 
  ███    ███   ███    ███ ███    ███     ███    ▀███▀▀██ ███    █▀  
  ███    ███  ▄███▄▄▄▄██▀ ███    ███     ███     ███   ▀ ███        
▀█████████▀  ▀▀███▀▀▀▀▀   ███    ███     ███     ███     ███        
  ███        ▀███████████ ███    ███     ███     ███     ███    █▄  
  ███          ███    ███ ███    ███     ███     ███     ███    ███ 
 ▄████▀        ███    ███  ▀██████▀  █▄ ▄███    ▄████▀   ████████▀  
               ███    ███            ▀▀▀▀▀▀                         '

clear
echo -e "\n$ansi_art\n"

sudo pacman -Sy --noconfirm --needed git

echo -e "\nCloning ProjTC..."
rm -rf ~/.local/share/projtc/
git clone https://github.com/brunohcorreia/projtc.git ~/.local/share/projtc >/dev/null

# Use custom branch if instructed
if [[ -n "$PROJTC_REF" ]]; then
  echo -e "\eUsing branch: $PROJTC_REF"
  cd ~/.local/share/projtc
  git fetch origin "${PROJTC_REF}" && git checkout "${PROJTC_REF}"
  cd -
fi

echo -e "\nInstallation starting..."
source ~/.local/share/projtc/install.sh
