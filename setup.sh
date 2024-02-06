echo "Actualizando Termux..."
for i in {1..2}; do
	sleep 1
	echo -e "\n"
done

pkg update -y && pkg upgrade -y
clear

echo "Instalando paquetes..."
for i in {1..2}; do
	sleep 1
	echo -e "\n"
done

pkg install zsh -y
pkg install golang -y
pkg install golang-doc -y
pkg install neovim -y
pkg install neofetch -y
pkg install screenfetch -y
pkg install bat -y
pkg install ranger -y
pkg install ytfzf -y
pkg install ani-cli -y
pkg install tmux -y
pkg install tree -y
pkg install cowsay -y
pkg install cmatrix -y
pkg install starship -y
pkg install htop -y
clear

echo "Instalando ohmyzsh..."
for i in {1..2}; do
	sleep 1
	echo -e "\n"
done
clear

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Instalando tmp(tmux)..."
for i in {1..2}; do
	sleep 1
	echo -e "\n"
done
clear

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


echo "Creando directorios y links simbólicos..."
for i in {1..2}; do
	sleep 1
	echo -e "\n"
done
clear

# ln -s <archivo/carptea original> <donde quero que este>

# dot en home
rm -rf $HOME/.zshrc && ln -s $HOME/dotfiles/.zshrc $HOME/
rm -rf $HOME/.tmux.conf && ln -s $HOME/dotfiles/.tmux.conf $HOME/

# termux
rm -rf $HOME/.termux && ln -s $HOME/dotfiles/.termux $HOME/

# configs
mkdir $HOME/.config/
ln -s $HOME/dotfiles/.config/ytfzf $HOME/.config/
ln -s $HOME/dotfiles/.config/nvim $HOME/.config/
ln -s $HOME/dotfiles/.config/ranger $HOME/.config/
ln -s $HOME/dotfiles/.config/starship.toml $HOME/.config/

clear
echo "listo"



