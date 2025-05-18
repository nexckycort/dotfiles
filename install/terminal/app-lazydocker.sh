# Install lazydocker if not already installed
if ! command -v lazydocker >/dev/null 2>&1; then
  echo "📦 Installing lazydocker..."
  
  cd /tmp || exit 1
  LAZYDOCKER_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazydocker/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')

  curl -sLo lazydocker.tar.gz "https://github.com/jesseduffield/lazydocker/releases/latest/download/lazydocker_${LAZYDOCKER_VERSION}_Linux_x86_64.tar.gz"
  tar -xf lazydocker.tar.gz lazydocker

  sudo install lazydocker /usr/local/bin

  rm lazydocker.tar.gz lazydocker
  cd - || exit 1

  echo "✅ lazydocker installed successfully."
else
  echo "✔️ lazydocker is already installed."
fi