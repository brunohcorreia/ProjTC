#!/bin/bash

# Instalando o plymouth e o tema arch-logo
sudo pacman -S --noconfirm plymouth plymouth-theme-arch-logo

# Define o tema padrão como arch-logo e já atualiza o initramfs
sudo plymouth-set-default-theme -R arch-logo

# Atualiza o mkinitcpio.conf: insere 'plymouth' antes de 'systemd'
sudo sed -i 's/^HOOKS=(\(.*\)systemd/\1plymouth systemd/' /etc/mkinitcpio.conf

# Regenera o initramfs para todos os kernels
sudo mkinitcpio -P

# Adiciona parâmetro 'splash' no GRUB
sudo sed -i 's/GRUB_CMDLINE_LINUX="/GRUB_CMDLINE_LINUX="splash /' /etc/default/grub

# Regenera o GRUB
sudo grub-mkconfig -o /boot/grub/grub.cfg

# Garante que o plymouth saia antes do login (ly) iniciar
sudo mkdir -p /etc/systemd/system/ly.service.d
echo -e "[Service]\nExecStartPre=/usr/bin/plymouth quit" | sudo tee /etc/systemd/system/ly.service.d/plymouth.conf

echo -e "\n✅ Plymouth configurado com sucesso!\nSe quiser testar, reinicie com: sudo reboot"
