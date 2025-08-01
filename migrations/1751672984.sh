echo "Add Croc as new default application"

if ! command -v croc &>/dev/null; then
  yay -S --noconfirm --needed croc
fi
