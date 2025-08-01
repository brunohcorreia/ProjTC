#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

PROJTC_INSTALL=~/.local/share/projtc/install

# Give people a chance to retry running the installation
catch_errors() {
  echo -e "\n\e[31mProjTC installation failed!\e[0m"
  echo "You can retry by running: bash ~/.local/share/projtc/install.sh"
  echo "Get help from the community: https://discord.gg/tXFUdasqhY"
}

trap catch_errors ERR

show_logo() {
  clear
  tte -i ~/.local/share/projtc/logo.txt --frame-rate ${2:-120} ${1:-expand}
  echo
}

show_subtext() {
  echo "$1" | tte --frame-rate ${3:-640} ${2:-wipe}
  echo
}

# Install prerequisites
source $PROJTC_INSTALL/preflight/aur.sh
source $PROJTC_INSTALL/preflight/presentation.sh

# Configuration
show_logo beams 240
show_subtext "Let's install ProjTC! [1/5]"
source $PROJTC_INSTALL/config/identification.sh
source $PROJTC_INSTALL/config/config.sh
source $PROJTC_INSTALL/config/detect-keyboard-layout.sh #
source $PROJTC_INSTALL/config/fix-fkeys.sh
source $PROJTC_INSTALL/config/network.sh
source $PROJTC_INSTALL/config/power.sh
source $PROJTC_INSTALL/config/timezones.sh
source $PROJTC_INSTALL/config/login.sh
source $PROJTC_INSTALL/config/nvidia.sh

# Development
show_logo decrypt 920
show_subtext "Installing terminal tools [2/5]"
source $PROJTC_INSTALL/development/terminal.sh
source $PROJTC_INSTALL/development/development.sh
source $PROJTC_INSTALL/development/nvim.sh
source $PROJTC_INSTALL/development/ruby.sh
source $PROJTC_INSTALL/development/docker.sh
source $PROJTC_INSTALL/development/firewall.sh

# Desktop
show_logo slice 60
show_subtext "Installing desktop tools [3/5]"
source $PROJTC_INSTALL/desktop/desktop.sh

# Decidir depois Window Manager
source $PROJTC_INSTALL/desktop/hyprlandia.sh
source $PROJTC_INSTALL/desktop/i3landia.sh
source $PROJTC_INSTALL/desktop/awesomelandia.sh
source $PROJTC_INSTALL/desktop/bsplandia.sh
source $PROJTC_INSTALL/desktop/openlandia.sh

source $PROJTC_INSTALL/desktop/theme.sh
source $PROJTC_INSTALL/desktop/bluetooth.sh
source $PROJTC_INSTALL/desktop/asdcontrol.sh
source $PROJTC_INSTALL/desktop/fonts.sh
source $PROJTC_INSTALL/desktop/printer.sh

# Apps
show_logo expand
show_subtext "Installing default applications [4/5]"
source $PROJTC_INSTALL/apps/webapps.sh
source $PROJTC_INSTALL/apps/xtras.sh
source $PROJTC_INSTALL/apps/mimetypes.sh

# Updates
show_logo highlight
show_subtext "Updating system packages [5/5]"
sudo updatedb
sudo pacman -Syu --noconfirm

# Reboot
show_logo laseretch 920
show_subtext "You're done! So we'll be rebooting now..."
sleep 2
reboot
