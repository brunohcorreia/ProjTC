#!/bin/bash

set -e

# Instala o gerenciador de login Ly
sudo pacman -S --noconfirm --needed ly 

# Regenera o initramfs (caso tenha feito alterações manuais no HOOKS antes)
sudo mkinitcpio -P

# Regenera o GRUB (caso queira garantir que está atualizado)
sudo grub-mkconfig -o /boot/grub/grub.cfg

# Habilita o Ly para iniciar com o sistema
sudo systemctl disable DISPLAY_MANAGER
sudo systemctl disable getty@tty2.service
sudo systemctl enable ly.service

echo -e "\nLy configurado com sucesso!"
