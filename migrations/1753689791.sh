echo "Add the new ristretto theme as an option"

if [[ ! -L ~/.config/projtc/themes/ristretto ]]; then
  ln -nfs ~/.local/share/projtc/themes/ristretto ~/.config/projtc/themes/
fi
