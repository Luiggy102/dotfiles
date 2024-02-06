##############################
echo "Actualizando Termux..."
for i in {1..2}; do
	sleep 1
	echo -e "\n"
done

pkg update -y && pkg upgrade -y
clear

##############################
echo "Instalando paquetes..."
for i in {1..2}; do
	sleep 1
	echo -e "\n"
done

pkg install zsh -y
pkg install golang -y
pkg install golang-doc -y
pkg install neovim -y
pkg install bat -y
pkg install ranger -y
pkg install ytfzf -y
pkg install fastfetch -y
pkg install nodejs -y
pkg install ani-cli -y
pkg install tmux -y
pkg install lsd -y
pkg install tree -y
pkg install cowsay -y
pkg install cmatrix -y
pkg install starship -y
pkg install htop -y
clear

############################
echo "Creando directorios y links simbólicos..."
for i in {1..2}; do
	sleep 1
	echo -e "\n"
done
clear

# ln -s <archivo/carptea original> <donde quero que este>

# dot en home
rm -rf $HOME/.tmux.conf && ln -s $HOME/dotfiles/.tmux.conf $HOME/

# termux
rm -rf $HOME/.termux && ln -s $HOME/dotfiles/.termux $HOME/

# configs
mkdir $HOME/.config/
mkdir $HOME/go/
mkdir $HOME/go/src/
ln -s $HOME/dotfiles/.config/ytfzf $HOME/.config/
ln -s $HOME/dotfiles/.config/nvim $HOME/.config/
ln -s $HOME/dotfiles/.config/ranger $HOME/.config/
ln -s $HOME/dotfiles/.config/starship.toml $HOME/.config/
clear


################################
echo "Instalando tmp(tmux)..."
for i in {1..2}; do
	sleep 1
	echo -e "\n"
done
clear

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

################################
echo "Instalando ohmyzsh..."
for i in {1..2}; do
	sleep 1
	echo -e "\n"
done
clear

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
