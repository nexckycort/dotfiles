git config --global pull.rebase true
git config --global init.defaultBranch main
git config --global url."ssh://git@github.com/".insteadOf "https://github.com/"

# Set identification from install inputs
if [[ -n "${OMAKUB_USER_NAME//[[:space:]]/}" ]]; then
  git config --global user.name "$OMAKUB_USER_NAME"
fi

if [[ -n "${OMAKUB_USER_EMAIL//[[:space:]]/}" ]]; then
  git config --global user.email "$OMAKUB_USER_EMAIL"
fi