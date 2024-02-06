# My Dotfiles for Termux 📱

## Instalation

1. Upgrade Termux
```
pkg update -y && pkg upgrade -y
```

2. Install git
```
pkg install git -y
```

3. Clone the termux brach from the repo
```
git clone -b termux git@github.com:Luiggy102/dotfiles.git
```

4. Go to the dir
```
cd dotfiles
```

5. Make the setup script executable
```
chmod +x setup.sh
```

6. run it
```
./setup.sh
```
*Post install*
```
rm -rf $HOME/.zshrc && ln -s $HOME/dotfiles/.zshrc $HOME/
```
