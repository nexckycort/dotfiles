# Needed for all installers
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y curl git unzip zsh

git config --global --unset url."ssh://git@github.com/".insteadOf

# Run terminal installers
for installer in ~/.local/share/oni-setup/install/terminal/*.sh; do source $installer; done