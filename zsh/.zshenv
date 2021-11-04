export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$ZDOTDIR/.zhistory"
export HISTSIZE=10000
export SAVEHIST=10000

# Preferred editor for local and remote sessions
export EDITOR=nano

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# https://www.reddit.com/r/linux/comments/4qdnk3/til_how_to_display_colors_in_less/d4s6wdf
export LESS="-RM"

if [ -d $HOME/.local/bin ]; then
	export PATH=$HOME/.local/bin:$PATH
fi

if [ -d $HOME/.gem/ruby/3.0.0/bin ]; then
	export PATH=$HOME/.gem/ruby/3.0.0/bin:$PATH
fi

if [ -d $HOME/.yarn/bin ]; then
	export PATH=$HOME/.yarn/bin:$PATH
fi
