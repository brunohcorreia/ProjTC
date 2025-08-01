echo "Allow updating of timezone by right-clicking on the clock (or running projtc-cmd-tzupdate)"
if ! command -v tzupdate &>/dev/null; then
  bash ~/.local/share/projtc/install/config/timezones.sh
  projtc-refresh-waybar
fi
