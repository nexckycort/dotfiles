set -e

if ! command -v pnpm >/dev/null 2>&1; then
  echo "📦 Installing pnpm..."
  curl -fsSL https://get.pnpm.io/install.sh | sh -
else
  echo "✔️ pnpm is already installed."
fi
