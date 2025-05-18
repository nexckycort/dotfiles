set -e

echo "alias lzd=lazydocker" >> ~/.zshrc
echo "alias pn=pnpm" >> ~/.zshrc

PNPM_SNIPPET='# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end'

if ! grep -q '# pnpm' "$HOME/.zshrc"; then
  echo "$PNPM_SNIPPET" >> "$HOME/.zshrc"
  echo "✅ Agregado bloque de pnpm a .zshrc"
else
  echo "ℹ️  El bloque de pnpm ya está presente en .zshrc"
fi