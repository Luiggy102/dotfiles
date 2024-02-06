# My Dotfiles for Termux 📱

## Instalation

1. Upgrade Termux and install git
```
pkg update -y && pkg upgrade -y && pkg install git -y
```

2. Clone the termux brach from the repo
```
git clone -b termux https://github.com/Luiggy102/dotfiles.git
```

3. Go to the dir
```
cd dotfiles
```

4. Make the setup script executable
```
chmod +x setup.sh
```

5. run it
```
./setup.sh
```
***Post install***
```
rm -rf $HOME/.zshrc && ln -s $HOME/dotfiles/.zshrc $HOME/
```
