export EDITOR='nvim'
export QT_QPA_PLATFORMTHEME='qt5ct'
export ZSH=$HOME/.oh-my-zsh
export FZF_DEFAULT_OPTS="--border --padding 2%"

# golang
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
# export GOROOT=/usr/lib/go

# PATH
# export PATH=$PATH:$GOPATH:$GOBIN
export PATH=$PATH:$GOPATH:$GOBIN:~/.cargo/bin
# export PATH=$PATH:$GOBIN:$GOROOT/bin

zstyle ':omz:update' mode disabled  # disable automatic updates

plugins=(
colored-man-pages
git
vi-mode 
copypath 
sudo 
web-search
copybuffer # ctrl + o para copiar lo que esta en la terminal
dirhistory # alt + izquierda regresa, alt + derecha vuelve, etc
history    # hsi: buscar en historia
fzf
golang
)
#rust

source $ZSH/oh-my-zsh.sh

# On-demand rehash
zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}

add-zsh-hook -Uz precmd rehash_precmd

alias v='nvim'
#alias k='tmux a'
#alias kk='tmux'
alias t='tmux a || tmux'
#alias tt='tmux'
alias o='xdg-open'
#alias oo='onlyoffice-desktopeditors ~/'
alias lg='lazygit'
alias s='nvim -S ~/.config/nvim/session/Session.vim'
alias j='joplin'
alias castero='python3 -m castero'
alias p='python3'
alias dl="cd $HOME/Downloads"

alias off='sudo shutdown -h now'

alias l='lsd'
alias ls='lsd'
alias lsa='lsd -lah'
alias la='lsd -lAh'
alias ll='lsd -lh'

alias mpv='mpv --ytdl-format=worst'

# bat extras
alias b='bat'
alias bgrep='batgrep'
alias bpipe='batpipe'
alias bwatch='batwatch'
alias bdiff='batdiff'
alias pbat='prettybat'

#alias install='sudo apt install'

alias ytv="youtube-dl --recode-video mp4" # descargar video
alias yta="yt-dlp -x --audio-format m4a" # descargar audio

# Metadatos
alias vm="exiftool -n"
alias dm="exiftool -all="
alias cl="clear"

# traductor
#alias t="trans"
alias tda='trans -speak -download-audio'
alias cts='for i in *.ts; do ffmpeg -i "$i" "${i%.*}.mp4"; done && rm -rf *ts'
alias tae='trans de:es'
alias tea='trans es:de'

# youtube
alias y='ytfzf --ytdl-pref=bestvideo+bestaudio'
alias yt='ytfzf -t'
alias ym='ytfzf -m'
alias vw='nvim -c "VimwikiIndex"'

# dir
alias nvc='cd ~/.config/nvim/'
alias dot='cd ~/dotfiles/'

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# atajos de teclado 
run_ranger () {
    echo
    ranger --choosedir=$HOME/.rangerdir < $TTY
    LASTDIR=`cat $HOME/.rangerdir`
    cd "$LASTDIR"
    zle reset-prompt
}
zle -N run_ranger
bindkey '^f' run_ranger

run_nvim() {
	echo "nvim ."
	nvim .
	zle reset-prompt
	zle redisplay
}
zle -N run_nvim
bindkey '^v' run_nvim

run_dir_fzf() {
	echo "cd"
	cd $(find -type d | fzf)
	zle reset-prompt
	zle redisplay
}
zle -N run_dir_fzf
bindkey '^j' run_dir_fzf

fast_source() {
	echo "source ~/.zshrc"
    source ~/.zshrc
	zle reset-prompt
	zle redisplay
}
zle -N fast_source
bindkey '^s' fast_source

# extra alias
if [ -f ~/.zsh_aliases ]; then
    source ~/.zsh_aliases
else
    print "404: ~/.zsh_aliases not found."
fi

# What OS are we running?
if [[ $(uname) == "Darwin" ]]; then
    echo "macos"

elif command -v dnf > /dev/null; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh        

elif command -v pacman > /dev/null; then
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

else
    echo 'Unknown OS!'
fi

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
# pfetch
autoload -U compinit; compinit
