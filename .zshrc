export EDITOR='nvim'
export QT_QPA_PLATFORMTHEME='qt6ct'
export QT_QPA_PLATFORM='wayland onlyoffice'
export QT_QPA_PLATFORM='xcb onlyoffice'
export ANKI_WAYLAND=1
export WLR_NO_HARDWARE_CURSORS=1
export ZSH=$HOME/.oh-my-zsh
export FZF_DEFAULT_OPTS="--border --padding 2%"
export PF_ASCII='tux'
export BAT_THEME="Catppuccin-mocha"
#export FZF_DEFAULT_COMMAND="fd --type f"
#ZSH_THEME="fwalch"
#ZSH_THEME="powerlevel10k/powerlevel10k"

zstyle ':omz:update' mode disabled  # disable automatic updates

plugins=(
colored-man-pages
git
vi-mode 
copypath 
node
sudo 
web-search
copybuffer # ctrl + o para copiar lo que esta en la terminal
dirhistory # alt + izquierda regresa, alt + derecha vuelve, etc
history    # hsi: buscar en historia
rust
fzf
)

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

# bat extras
alias b='bat'
alias bgrep='batgrep'
alias man='man -Les'
alias bpipe='batpipe'
alias bwatch='batwatch'
alias bdiff='batdiff'
alias pbat='prettybat'

alias rm='rm -i'

#alias install='sudo apt install'

alias ytv="youtube-dl --recode-video mp4" # descargar video
#alias yta="youtube-dl -x --audio-format mp3" # descargar audio
alias yta="yt-dlp -x --audio-format m4a" # descargar audio

# Metadatos
alias vm="exiftool -n"
alias dm="exiftool -all="

# traductor
#alias t="trans"
alias tda='trans -speak -download-audio'
alias cts='for i in *.ts; do ffmpeg -i "$i" "${i%.*}.mp4"; done && rm -rf *ts'
alias tae='trans de:es'
alias tea='trans es:de'

# youtube
alias y='ytfzf'
alias yt='ytfzf -t'
alias ym='ytfzf -m'

alias nvc='cd $HOME/.config/nvim/' 
alias dc='cd $HOME/Documents' 
#alias pseint='zsh /usr/local/bin/pseint/pseint'

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

#run_nvim_nerdTree() {
	#echo "nvim"
	#nvim -c ":History"
	#zle reset-prompt
	#zle redisplay
#}
#zle -N run_nvim_nerdTree
#bindkey '^v' run_nvim_nerdTree

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

#run_ytfzf() {
	#echo "ytfzf"
	#ytfzf 
	#zle reset-prompt
	#zle redisplay
#}
#zle -N run_ytfzf
#bindkey '^y' run_ytfzf



#function rangerFileManager() { echo "ranger" ; ranger ; zle reset-prompt; zle redisplay }
#zle -N rangerFileManager
#bindkey '^f' rangerFileManager


source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source ~/Repos/extra/powerlevel10k/powerlevel10k.zsh-theme
#asasdfa

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#source ~/Repos/extra/powerlevel10k/powerlevel10k.zsh-theme
eval "$(starship init zsh)"
