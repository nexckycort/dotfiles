set -e
# Install Oh My Zsh if not installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "💡 Installing Oh My Zsh..."
  RUNZSH=no KEEP_ZSHRC=yes \
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "✔️ Oh My Zsh is already installed."
fi

# Change default shell to zsh if not already set
if [ "$SHELL" != "$(which zsh)" ]; then
  echo "💻 Changing default shell to zsh..."
  chsh -s "$(which zsh)"
else
  echo "✔️ Default shell is already zsh."
fi