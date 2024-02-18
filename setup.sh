# This setup script is meant to be used in a Archlinux distro with yay installed

# echo "=== Setting up yay ==="
# git clone https://aur.archlinux.org/yay.git
# cd yay/
# makepkg -si

echo "Update system..."
for i in {1..2}; do
	sleep 1
	echo -e "\n"
done

yay -Syyu
clear

echo "Installing packages..."
for i in {1..2}; do
	sleep 1
	echo -e "\n"
done

echo "Setting up system utils"
yay -S alsa-utils feh kitty redshift ytfzf nmcli lsd flatpack gutenprint sxiv ninja gcc wayland-protocols libjpeg-turbo libwebp pango cairo pkgconf cmake libglvnd wayland

echo "Setting up fonts"
yay -S ttf-jetbrains-mono-nerd ttf-iosevka-nerd
fc-cache -f -v

echo "Setting up development utils"
yay -S curl wget openssh bat bat-extras fzf git htop highlight neovim ranger tmux zsh zsh-autosuggestions zsh-syntax-highlighting tree starship

echo "Setting up desktop utils"
yay -S hyprland hyprpaper dunst fuzzel waybar swayidle swaylock wl-clipboard slurp grim thunar dolphin

echo "Setting up programming languages"
yay -S nodejs npm go

echo "Setting up apps"
yay -S firefox keepassxc libreoffice-still-es mpv simple-scan zathura zathura-pdf-mupdf kdeconnect

echo "Creating dirs and symbolic links..."
for i in {1..2}; do
	sleep 1
	echo -e "\n"
done
clear

# remove if anay
rm -rf $HOME/.config/dunst
rm -rf $HOME/.config/hypr
rm -rf $HOME/.config/kitty
rm -rf $HOME/.config/nvim
rm -rf $HOME/.config/ranger
rm -rf $HOME/.config/swaylock
rm -rf $HOME/.config/waybar
rm -rf $HOME/.config/starship.toml
rm -rf $HOME/.tmux.conf 

# copy the configs
ln -s $HOME/dotfiles/.tmux.conf $HOME/
ln -s $HOME/dotfiles/.config/dunst $HOME/.config/
ln -s $HOME/dotfiles/.config/hypr $HOME/.config/
ln -s $HOME/dotfiles/.config/kitty $HOME/.config/
ln -s $HOME/dotfiles/.config/nvim $HOME/.config/
ln -s $HOME/dotfiles/.config/ranger $HOME/.config/
ln -s $HOME/dotfiles/.config/swaylock $HOME/.config/
ln -s $HOME/dotfiles/.config/waybar $HOME/.config/
ln -s $HOME/dotfiles/.config/starship.toml $HOME/.config/
clear

echo "Installing tmp(tmux)..."
for i in {1..2}; do
	sleep 1
	echo -e "\n"
done
clear

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Installing ohmyzsh..."
for i in {1..2}; do
	sleep 1
	echo -e "\n"
done
clear

# Post install:
# rm -rf $HOME/.zshrc && ln -s $HOME/dotfiles/.zshrc $HOME/
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
