echo "Adding ProjTC version info to fastfetch"
if ! grep -q "projtc" ~/.config/fastfetch/config.jsonc; then
  cp ~/.local/share/projtc/config/fastfetch/config.jsonc ~/.config/fastfetch/
fi

