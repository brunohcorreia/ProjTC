echo "Add new matte black theme"

if [[ ! -L "~/.config/projtc/themes/matte-black" ]]; then
  ln -snf ~/.local/share/projtc/themes/matte-black ~/.config/projtc/themes/
fi
