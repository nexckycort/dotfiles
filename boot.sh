set -e

echo "=> Ubuntu 24.04+ installations only!"
echo -e "\nBegin installation (or abort with ctrl+c)..."

sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

if git config --global --get url.ssh://git@github.com/.insteadOf >/dev/null; then
  git config --global --unset url.ssh://git@github.com/.insteadOf
fi

echo "Cloning Oni Setup..."
rm -rf ~/.local/share/oni-setup
git clone https://github.com/nexckycort/oni-setup.git ~/.local/share/oni-setup >/dev/null

echo "Installation starting..."
source ~/.local/share/oni-setup/install.sh