#!/bin/bash

# -----------------------------
# Exit early if shell is non-interactive
# -----------------------------
if [ ! -t 0 ]; then
  echo "⚠️ This script is intended to be run interactively. Aborting."
  exit 1
fi

echo "⏳ Setting up environment..."

# -----------------------------
# Update package list
# -----------------------------
echo "🔄 Updating package list..."
sudo apt-get update >/dev/null

# -----------------------------
# Install required packages
# -----------------------------
REQUIRED_PKGS="git unzip zsh stow xclip"
for pkg in $REQUIRED_PKGS; do
  if ! dpkg -s "$pkg" >/dev/null 2>&1; then
    echo "🔧 Installing $pkg..."
    sudo apt install -y "$pkg"
  else
    echo "✔️ $pkg is already installed."
  fi
done

# Clone your dotfiles repo (if not already cloned)
if [ ! -d "$HOME/dotfiles" ]; then
  echo "📥 Cloning dotfiles repo..."
  git clone https://github.com/nexckycort/dotfiles.git ~/dotfiles
else
  echo "✔️ dotfiles repo already cloned."
fi

# -----------------------------
# Install Oh My Zsh
# -----------------------------
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "💡 Installing Oh My Zsh..."
  RUNZSH=no KEEP_ZSHRC=yes \
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "✔️ Oh My Zsh is already installed."
fi

# -----------------------------
# Install pnpm
# -----------------------------
if ! command -v pnpm >/dev/null 2>&1; then
  echo "📦 Installing pnpm..."
  curl -fsSL https://get.pnpm.io/install.sh | sh -
else
  echo "✔️ pnpm is already installed."
fi

# -----------------------------
# Install mise
# -----------------------------
if ! command -v mise >/dev/null 2>&1; then
  echo "📦 Installing mise..."
  curl https://mise.run | sh
else
  echo "✔️ mise is already installed."
fi

# Source .zshrc to apply changes in the current session
# echo "🔄 Sourcing ~/.zshrc..."
# source ~/.zshrc

# -----------------------------
# Set default shell to zsh
# -----------------------------
if [ "$SHELL" != "$(which zsh)" ]; then
  echo "💻 Changing default shell to zsh..."
  sudo chsh -s $(which zsh)
else
  echo "✔️ Default shell is already zsh."
fi

# -----------------------------
# Apply dotfiles using Stow
# -----------------------------
echo "📦 Applying dotfiles with stow..."
cd "$HOME/dotfiles" || exit 1

# Handle existing .zshrc safely
if [ -f "$HOME/.zshrc" ]; then
  echo "⚠️ Existing .zshrc found. Do you want to overwrite it with your dotfiles version? (y/n)"
  read -r -p "> " overwrite_zshrc
  if [[ "$overwrite_zshrc" =~ ^[Yy]$ ]]; then
    rm -f ~/.zshrc
    stow zsh
  else
    echo "⏭️ Skipping .zshrc stow."
  fi
else
  stow zsh
fi

# Apply other configs
stow git

# -----------------------------
# Optional SSH key generation
# -----------------------------
if [ ! -f "$HOME/.ssh/id_ed25519" ]; then
  echo ""
  read -r -p "🔐 No SSH key found. Do you want to generate a new SSH key? (y/n) > " answer
  if [[ "$answer" =~ ^[Yy]$ ]]; then
    read -r -p "📧 Enter your email address for the SSH key: " ssh_email
    echo "🗝️ Generating a new SSH key..."
    ssh-keygen -t ed25519 -C "$ssh_email" -f "$HOME/.ssh/id_ed25519" -N ""

    # Start ssh-agent in the background
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ed25519
    
    if command -v xclip >/dev/null 2>&1; then
      cat "$HOME/.ssh/id_ed25519.pub" | xclip -selection clipboard
      echo "📋 Public key copied to clipboard."
    else
      echo "ℹ️ Install xclip to automatically copy your public key to clipboard."
    fi

    echo "➡️ Add this public key to GitHub/GitLab/etc:"
    echo ""
    cat "$HOME/.ssh/id_ed25519.pub"
  else
    echo "⏭️ Skipping SSH key generation."
  fi
else
  echo "✔️ SSH key already exists."

  # Start ssh-agent and add key, just in case
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_ed25519
fi

echo "✅ Setup complete. Restart your terminal to apply the changes."
