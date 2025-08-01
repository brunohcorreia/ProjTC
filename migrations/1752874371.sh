echo "Add Catppuccin Latte light theme"
if [[ ! -L "~/.config/projtc/themes/catppuccin-latte" ]]; then
  ln -snf ~/.local/share/projtc/themes/catppuccin-latte ~/.config/projtc/themes/
fi
