#!/usr/bin/env bash
set -euo pipefail

# Detect distro
if [ -f /etc/arch-release ]; then
    DISTRO="arch"
elif [ -f /etc/debian_version ]; then
    DISTRO="debian"
elif [ -f /etc/fedora-release ]; then
    DISTRO="fedora"
else
    echo "❌ Unsupported distro"
    exit 1
fi

echo "📦 Detected: $DISTRO"

# --- Install base tools ---
if [ "$DISTRO" = "arch" ]; then
    sudo pacman -Syu --noconfirm
    sudo pacman -S --noconfirm base-devel git stow flatpak curl
    if ! command -v paru &>/dev/null; then
        git clone https://aur.archlinux.org/paru.git
        cd paru && makepkg -si --noconfirm && cd ..
        rm -rf paru
    fi
elif [ "$DISTRO" = "debian" ]; then
    sudo apt update
    sudo apt install -y git stow flatpak curl
elif [ "$DISTRO" = "fedora" ]; then
    sudo dnf upgrade -y
    sudo dnf install -y git stow flatpak curl
fi

# --- Enable flathub repo ---
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# --- Install packages from pkglist.txt ---
echo "📂 Installing from pkglist.txt..."
if [ "$DISTRO" = "arch" ]; then
    paru -S --needed - < pkglist.txt
elif [ "$DISTRO" = "debian" ]; then
    xargs -a pkglist.txt sudo apt install -y
elif [ "$DISTRO" = "fedora" ]; then
    xargs -a pkglist.txt sudo dnf install -y
fi

# --- Install Flatpak apps from flatpakpkg.txt ---
if [ -f flatpakpkg.txt ]; then
    echo "📦 Installing Flatpak apps..."
    while read -r app; do
        flatpak install -y flathub "$app"
    done < flatpakpkg.txt
else
    echo "⚠️ No flatpakpkg.txt found, skipping Flatpak apps"
fi

# install oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "✨ Installing Oh My Zsh..."
    RUNZSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# --- Setup dotfiles with stow ---
if [ -d "$HOME/dotfiles" ]; then
    echo "🔗 Stowing dotfiles..."
    cd "$HOME/dotfiles"
    stow */
else
    echo "⚠️ No ~/dotfiles found, skipping stow"
fi

echo "✅ Setup complete!"
