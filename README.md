# Oni Setup: A personal, opinionated setup for Ubuntu — just how I like it.

**Oni Setup** is my personal and opinionated configuration for Ubuntu 24.04+,
designed to automate the installation and setup of essential terminal and
desktop tools, as well as the application of custom dotfiles.

---

## Description

This project automates the setup of a personalized Ubuntu environment,
including:

- Installation of terminal tools like Docker, mise, pnpm, zsh with oh-my-zsh,
  fastfetch, lazydocker, etc.
- Safe application of dotfiles using `stow`.
- Adjustments for GNOME environments to improve the desktop experience.
- Organized scripts for modularity and easy maintenance.

---

## Requirements

- Ubuntu 24.04 or newer
- Internet connection to download packages and dotfiles
- User with sudo privileges

---

## Installation

Run the bootstrap script which clones the repository and starts the automatic
installation:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/nexckycort/oni-setup/main/boot.sh)"
```

Or clone manually and run the installer:

```bash
git clone https://github.com/nexckycort/oni-setup.git ~/.local/share/oni-setup
~/.local/share/oni-setup/install.sh
```

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file
for details.
