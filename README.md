# 🌟 My Personal Dotfiles for Ubuntu

This repository contains my personal configuration files (`dotfiles`) for
Ubuntu, managed with [GNU Stow](https://www.gnu.org/software/stow/) to keep
things modular and clean.

The included `setup.sh` script automates the setup process, making it easy to
configure a new system with my preferred tools and settings.

---

## 📋 Features

- **Automated Setup**: Installs required packages and tools.
- **Zsh Configuration**: Includes [Oh My Zsh](https://ohmyz.sh/) with a
  pre-configured `.zshrc`.
- **Git Configuration**: Custom `.gitconfig` with user details and aliases.
- **Modular Management**: Uses GNU Stow for clean and modular dotfile
  management.
- **Optional SSH Key Generation**: Automates SSH key creation and setup.

---

## 📦 Requirements

- Ubuntu 24.04+ installations only!
- `sudo` privileges
- Internet connection for downloading dependencies

---

## 🚀 Quickstart

Run the following command in your terminal to set up your environment:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/nexckycort/dotfiles/main/setup.sh)"
```

This will:

1. Update your package list.
2. Install required packages (`git`, `zsh`, `stow`, `unzip`, etc.).
3. Clone this repository into `~/dotfiles` (if not already cloned).
4. Install [Oh My Zsh](https://ohmyz.sh/), [pnpm](https://pnpm.io/), and
   [mise](https://mise.jdx.dev/) if missing.
5. Apply the dotfiles using GNU Stow.
6. Change your default shell to Zsh.
7. Optionally generate an SSH key if one does not exist.

---

## 📂 Repository Structure

```
dotfiles/
├── setup.sh        # Setup script to install packages and apply dotfiles
├── zsh/            # Zsh configuration (e.g., .zshrc)
└── git/            # Git configuration (.gitconfig)
```

Each folder contains files with the same relative paths that will be symlinked
into your home directory by GNU Stow.

---

## 🛠️ Usage

### Apply Configurations

To apply a specific configuration manually, use GNU Stow:

```bash
stow zsh      # Symlinks Zsh config files
stow git      # Symlinks Git config files
```

### Remove Configurations

To remove symlinks created by Stow:

```bash
stow -D zsh
```

---

## ⚙️ Customization

Feel free to edit the dotfiles inside their respective folders to tweak your
environment. For example:

- Modify `.zshrc` in the `zsh/` folder to customize your Zsh setup.
- Update `.gitconfig` in the `git/` folder with your preferred Git settings.

---

## 🔧 Setup Script Details

The `setup.sh` script performs the following tasks:

1. **Installs Required Packages**: Ensures `git`, `zsh`, `stow`, and other
   dependencies are installed.
2. **Clones the Repository**: Downloads this repository into `~/dotfiles` if it
   doesn't already exist.
3. **Installs Tools**:
   - [Oh My Zsh](https://ohmyz.sh/)
   - [pnpm](https://pnpm.io/)
   - [mise](https://mise.jdx.dev/)
4. **Applies Dotfiles**: Uses GNU Stow to symlink configuration files into your
   home directory.
5. **Sets Zsh as Default Shell**: Changes the default shell to Zsh.
6. **Generates SSH Key (Optional)**: Prompts to create an SSH key if none
   exists.

---

## 💡 Notes

- The `setup.sh` script will **not reinstall** packages or tools that are
  already installed.
- Existing configuration files (e.g., `.zshrc`) will prompt for confirmation
  before being overwritten.
- The default shell will be switched to Zsh automatically if it isn't already
  set.

---

## 📖 Resources

- [GNU Stow Documentation](https://www.gnu.org/software/stow/)
- [Oh My Zsh Wiki](https://github.com/ohmyzsh/ohmyzsh/wiki)
- [pnpm Documentation](https://pnpm.io/)
- [mise Documentation](https://mise.jdx.dev/)

---

## 📝 License

This repository is for personal use. Feel free to use it as inspiration for your
own dotfiles, but please customize it to suit your needs.
