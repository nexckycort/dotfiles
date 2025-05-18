set -e

DOTFILES_DIR="$HOME/.local/share/oni-setup/configs"
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
    stow -t "$HOME" zsh
  else
    echo "⏭️ Skipping .zshrc stow."
  fi
else
  echo "🗂️ Applying zsh dotfiles..."
  stow -t "$HOME" zsh
fi

echo "✅ Dotfiles applied successfully."
