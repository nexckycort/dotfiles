set -e

echo "📦 Ensuring 'stow' is installed..."

if ! command -v stow >/dev/null 2>&1; then
  echo "🔧 'stow' not found. Installing..."
  sudo apt-get update -qq
  sudo apt-get install -y stow
else
  echo "✔️ 'stow' is already installed."
fi

echo "📦 Applying dotfiles with stow..."

DOTFILES_DIR="$HOME/dotfiles"
cd "$DOTFILES_DIR" || { echo "❌ Failed to cd into $DOTFILES_DIR"; exit 1; }

# .zshrc safe handling
if [ -f "$HOME/.zshrc" ]; then
  echo "⚠️ Existing .zshrc found. Do you want to overwrite it with your dotfiles version? (y/n)"
  read -r -p "> " overwrite_zshrc
  if [[ "$overwrite_zshrc" =~ ^[Yy]$ ]]; then
    rm -f "$HOME/.zshrc"
    echo "🗂️ Applying zsh dotfiles..."
    stow zsh
  else
    echo "⏭️ Skipping .zshrc stow."
  fi
else
  echo "🗂️ Applying zsh dotfiles..."
  stow zsh
fi

# Apply other dotfiles like git
echo "🗂️ Applying git dotfiles..."
stow git

echo "✅ Dotfiles applied successfully."
