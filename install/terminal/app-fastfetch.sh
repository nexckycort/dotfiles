# Install and configure fastfetch
if ! command -v fastfetch >/dev/null 2>&1; then
  echo "📦 Installing fastfetch..."

  sudo apt update -y && sudo apt install -y software-properties-common
  sudo add-apt-repository -y ppa:zhangsongcui3371/fastfetch
  sudo apt update -y
  sudo apt install -y fastfetch
else
  echo "✔️ fastfetch is already installed."
fi

# Set configuration if not already set
if [ ! -f "$HOME/.config/fastfetch/config.jsonc" ]; then
  echo "🛠️ Setting up fastfetch configuration..."
  mkdir -p ~/.config/fastfetch
  cp ~/.local/share/oni-setup/configs/fastfetch.jsonc ~/.config/fastfetch/config.jsonc
fi