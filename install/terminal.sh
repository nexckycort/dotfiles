# Needed for all installers
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y curl git unzip zsh

if git config --global --get url.ssh://git@github.com/.insteadOf >/dev/null; then
  git config --global --unset url.ssh://git@github.com/.insteadOf
fi

# Run terminal installers
for installer in ~/.local/share/oni-setup/install/terminal/*.sh; do source $installer; done