set -e

if ! grep -q 'alias lzd=' "$HOME/.zshrc"; then
  echo "alias lzd=lazydocker" >> "$HOME/.zshrc"
fi

if ! grep -q 'alias pn=' "$HOME/.zshrc"; then
  echo "alias pn=pnpm" >> "$HOME/.zshrc"
fi

# pnpm PATH config
PNPM_SNIPPET='# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end'

if ! grep -q '# pnpm' "$HOME/.zshrc"; then
  echo "$PNPM_SNIPPET" >> "$HOME/.zshrc"
fi