# Needed for all installers
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y curl git unzip zsh build-essential

# Run terminal installers
for installer in ~/.local/share/oni-setup/install/terminal/*.sh; do source $installer; done