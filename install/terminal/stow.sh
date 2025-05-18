set -e

echo "📦 Ensuring 'stow' is installed..."

if ! command -v stow >/dev/null 2>&1; then
  echo "🔧 'stow' not found. Installing..."
  sudo apt-get update -qq
  sudo apt-get install -y stow
else
  echo "✔️ 'stow' is already installed."
fi

DOTFILES_DIR="$HOME/.local/share/oni-setup"
echo "📦 Applying dotfiles with stow from $DOTFILES_DIR..."

cd "$DOTFILES_DIR" || { echo "❌ Failed to cd into $DOTFILES_DIR"; exit 1; }

# Handle .zshrc carefully
ZSHRC="$HOME/.zshrc"
if [ -f "$ZSHRC" ]; then
  echo "⚠️ Existing .zshrc found. Overwrite with dotfiles version? (y/n)"
  read -r -p "> " overwrite_zshrc
  if [[ "$overwrite_zshrc" =~ ^[Yy]$ ]]; then
    rm -f "$ZSHRC"
    echo "🗂️ Applying zsh dotfiles..."
    stow zsh
  else
    echo "⏭️ Skipping .zshrc stow."
  fi
else
  echo "🗂️ Applying zsh dotfiles..."
  stow zsh
fi

# Apply other dotfiles
echo "🗂️ Applying git dotfiles..."
stow git

echo "✅ Dotfiles applied successfully."
