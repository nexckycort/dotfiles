# Install btop only if not already installed
if ! command -v btop &>/dev/null; then
  echo "📦 Installing btop..."
  sudo apt install -y btop
else
  echo "✔️ btop is already installed"
fi

# Apply Omakub btop config only if not already applied
if [ ! -f "$HOME/.config/btop/btop.conf" ]; then
  echo "⚙️  Applying btop config..."
  mkdir -p ~/.config/btop/themes
  cp ~/.local/share/oni-setup/configs/btop.conf ~/.config/btop/btop.conf
  cp ~/.local/share/oni-setup/themes/tokyo-night/btop.theme ~/.config/btop/themes/tokyo-night.theme
fi