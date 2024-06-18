# in /etc/dnf/dnf.conf
# max_parallel_downloads=10
# fastestmirror=True

# update
sudo dnf upgrade

# rpm fusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# utils
sudo dnf install zsh hyprland hyprpaper fuzzel swaylock swayidle bat lsd zoxide neovim zathura zathura-pdf-mupdf htop btop waybar light ufw gnome-pomodoro cava unrar lutris fzf mpv kitty keepassxc golang zsh-autosuggestions zsh-syntax-highlighting kde-connect-nautilus hugo wlsunset blueman fastfetch ranger bemenu

# firmware updates
sudo fwupdmgr refresh --force
sudo fwupdmgr get-updates
sudo fwupdmgr update

# veracrypt
wget https://launchpad.net/veracrypt/trunk/1.26.7/+download/veracrypt-1.26.7-CentOS-8-x86_64.rpm
sudo dnf install veracrypt-1.26.7-CentOS-8-x86_64.rpm
rm -rf veracrypt-1.26.7-CentOS-8-x86_64.rpm

# terminal images
sudo dnf config-manager --add-repo https://download.opensuse.org/repositories/home:justkidding/Fedora_40/home:justkidding.repo
sudo dnf install ueberzugpp

# better batery life laptop
git clone https://github.com/AdnanHodzic/auto-cpufreq.git
cd auto-cpufreq && sudo ./auto-cpufreq-installer
cd .. && rm -rf auto-cpufreq

# ytfzf 
git clone https://github.com/pystardust/ytfzf
cd ytfzf
sudo make install doc && cd .. && rm -rf ytfzf

# ani-cli
git clone "https://github.com/pystardust/ani-cli.git"
sudo cp ani-cli/ani-cli /usr/local/bin
rm -rf ani-cli

# freeze
go install github.com/charmbracelet/freeze@latest

# Screenshots dir
mkdir $HOME/Pictures/Screenshots

# flatpak packages
flatpak install signal anki

# tmux tmp
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# nerd fonts JetBrainsMono
mkdir JetBrainsMono && cd JetBrainsMono
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip && unzip JetBrainsMono.zip
rm -rf JetBrainsMono.zip
cd .. && sudo mv ./JetBrainsMono /usr/share/fonts

# nerd fonts Iosevka
mkdir Iosevka && cd Iosevka
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Iosevka.zip && unzip Iosevka.zip
rm -rf Iosevka.zip
cd .. && sudo mv ./Iosevka /usr/share/fonts

# update font cache
sudo fc-cache -fv

# starship prompt
curl -sS https://starship.rs/install.sh | sh

# firewall
sudo ufw enable

# symlinks
# remove if anay
rm -rf $HOME/.config/dunst
rm -rf $HOME/.config/hypr
rm -rf $HOME/.config/kitty
rm -rf $HOME/.config/nvim
rm -rf $HOME/.config/ranger
rm -rf $HOME/.config/swaylock
rm -rf $HOME/.config/waybar
rm -rf $HOME/.config/ytfzf
rm -rf $HOME/.config/fuzzel
rm -rf $HOME/.config/starship.toml
rm -rf $HOME/.config/zathura
rm -rf $HOME/.tmux.conf 

# copy the configs
ln -s $HOME/dotfiles/.tmux.conf $HOME/
ln -s $HOME/dotfiles/.config/dunst $HOME/.config/
ln -s $HOME/dotfiles/.config/fuzzel $HOME/.config/
ln -s $HOME/dotfiles/.config/ytfzf $HOME/.config/
ln -s $HOME/dotfiles/.config/hypr $HOME/.config/
ln -s $HOME/dotfiles/.config/kitty $HOME/.config/
ln -s $HOME/dotfiles/.config/nvim $HOME/.config/
ln -s $HOME/dotfiles/.config/ranger $HOME/.config/
ln -s $HOME/dotfiles/.config/swaylock $HOME/.config/
ln -s $HOME/dotfiles/.config/waybar $HOME/.config/
ln -s $HOME/dotfiles/.config/starship.toml $HOME/.config/
ln -s $HOME/dotfiles/.config/zathura ~/.config

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# activate zsh
rm -rf $HOME/.zshrc && ln -s $HOME/dotfiles/.zshrc $HOME/
