# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# https://thevaluable.dev/zsh-install-configure-mouseless/
autoload -U compinit
compinit
source "$ZDOTDIR/completion.zsh"

setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

source /etc/profile.d/autojump.zsh

# https://stackoverflow.com/a/24237590
zstyle ':complete:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias grep='grep --color=auto'
alias ls='ls --group-directories-first -N --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias lf='ls -F'
alias l.='ls -d .*'
alias lr='ls -R'
alias l='ls'
alias mkdir='mkdir -p'
alias hh='history 0 . | grep'
alias accio='sudo pacman -S'
alias aurccio='sudo aura -Ax'
alias depulso='sudo pacman -Rs'
alias ..='cd ..'
alias ....='cd ../..'
alias ......='cd ../../..'
alias ........='cd ../../../..'
alias nullc='echo -n | xc'
alias ffmpeg='ffmpeg -hide_banner'
alias ffprobe='ffprobe -hide_banner'
alias ffplay='ffplay -hide_banner'
alias word='cat /usr/share/dict/words | grep -Ei'
alias psg='ps aux | grep -i'

alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gca='git commit -am'
alias gp='git push'
alias gl='git log'
alias glo='git log --oneline'
alias gcl='git clone'
alias gd='git diff'
alias gpl='git pull'

# easy clipboard
alias xc='xclip -i -selection clipboard'
alias xv='xclip -o -selection clipboard'
alias xvimg='xclip -o -selection clipboard -target image/png'

# https://stackoverflow.com/a/3964198
function chpwd() {
	emulate -L zsh
	ls --group-directories-first -N --color=auto
}

eval "$(rbenv init -)"

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# https://blog.rabin.io/quick-tip/zsh-home-end-keys
bindkey '\e[1~'   beginning-of-line  # Linux console
bindkey '\e[H'    beginning-of-line  # xterm
bindkey '\eOH'    beginning-of-line  # gnome-terminal
bindkey '\e[2~'   overwrite-mode     # Linux console, xterm, gnome-terminal
bindkey '\e[3~'   delete-char        # Linux console, xterm, gnome-terminal
bindkey '\e[4~'   end-of-line        # Linux console
bindkey '\e[F'    end-of-line        # xterm
bindkey '\eOF'    end-of-line        # gnome-terminal

# https://unix.stackexchange.com/a/140499
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
