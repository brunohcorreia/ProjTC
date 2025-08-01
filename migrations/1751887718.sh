echo "Install Impala as new wifi selection TUI"
if ! command -v impala &>/dev/null; then
  yay -S --noconfirm --needed impala
fi
