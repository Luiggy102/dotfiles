#!/bin/sh

choises="pomofocus
github
goByExample
goTour
goProjectLayout1
goProjectLayout2
goStdLib
goProgramiz
anki











vw
vimwiki
zathura
songsterr
documentos
descargas
linkedin
waybar
monkeyType
kitty
invidious
symbolab
geogebra
pdf
protonMail
whatsapp
calculadoraDeSueño
deepl
simpleLogin
googleAcademico
telegram
pictures
videos
gitStatus
gitPull
editScript"

if ! command -v fuzzel &> /dev/null
then
    # fedora wayland gnome
    chosen=$(echo "$choises" | dmenu)
else 
    # else
    chosen=$(echo "$choises" | fuzzel -d)
fi

case "$chosen" in
    
    # -- links go -- #
    goByExample ) firefox 'https://gobyexample.com/' ;;
    goTour ) firefox 'https://go.dev/tour/welcome/1' ;;
    goProjectLayout1 ) firefox 'https://github.com/golang-standards/project-layout/blob/master/README_es.md' ;;
    goProjectLayout2 ) firefox 'https://go.dev/doc/modules/layout' ;;
    goStdLib ) firefox 'https://pkg.go.dev/' ;;
    goProgramiz ) firefox 'https://www.programiz.com/golang' ;;

	
    # -- Folders -- #
    documentos ) dolphin $HOME/Documents/ ;;
    pictures ) dolphin $HOME/Pictures ;;
    descargas ) dolphin $HOME/Downloads ;;
    videos ) dolphin $HOME/Videos ;;
	
    # -- Apps -- #
	firefox ) firefox ;;
    kitty ) kitty ;; 
	zathura ) zathura ;;
	pdf ) zathura ;;
    keepassXC ) keepassxc ;;
    
    # -- scripts -- #
    gitStatus ) upgit -sn ;;
    gitPull ) upgit -lln ;;
    waybar ) waybar ;;

    # -- wiki -- #
    vw ) kitty -d=~/vimwiki/ nvim -c "VimwikiIndex" ;;
    vimwiki ) kitty -d=~/vimwiki/ nvim -c "VimwikiIndex" ;;

    # -- Links -- # 
    songsterr ) firefox 'https://www.songsterr.com/' ;;
    monkeyType ) firefox 'https://monkeytype.com/' ;;
	telegram ) firefox 'https://web.telegram.org/' ;;
    anki ) firefox 'https://ankiweb.net/decks' ;;
    github ) firefox 'https://github.com/Luiggy102?tab=repositories' ;;
    deepl ) firefox 'https://www.deepl.com/translator' ;;
    simpleLogin ) firefox 'https://app.simplelogin.io/dashboard/' ;;
	invidious ) firefox 'https://yt.cdaut.de/search' ;;
	geogebra ) firefox 'https://www.geogebra.org/graphing?lang=en' ;;
	calculadoraDeSueño ) firefox 'https://sleepytime.cc/' ;;
	googleAcademico) firefox 'https://scholar.google.com/' ;;
	symbolab) firefox 'https://es.symbolab.com/' ;;
    linkedin ) firefox 'https://www.linkedin.com/feed/';;
	whatsapp) firefox 'https://web.whatsapp.com' ;;
	tutanota) firefox 'https://app.tuta.com/mail/' ;;
	calendario ) firefox 'https://calendar.proton.me/u/0/' ;;
	protonMail ) firefox 'https://mail.proton.me/u/0/inbox' ;;
    pomofocus ) firefox 'https://pomofocus.io/' ;;

    # -- editConfig -- # 
    editScript ) kitty -d=~/dotfiles/ nvim $HOME/dotfiles/.scripts/launcher.sh ;;

esac
