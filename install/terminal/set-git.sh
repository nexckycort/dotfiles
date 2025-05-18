git config --global pull.rebase true
git config --global init.defaultBranch main

# Set identification from install inputs
if [[ -n "${OS_USER_NAME//[[:space:]]/}" ]]; then
  git config --global user.name "$OS_USER_NAME"
fi

if [[ -n "${OS_USER_EMAIL//[[:space:]]/}" ]]; then
  git config --global user.email "$OS_USER_EMAIL"
fi