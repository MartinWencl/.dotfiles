# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Aliases
alias zshc="nvim ~/.zshrc"
alias nc="nvim ~/.config/nvim/init.lua"
alias omzsh="nvim ~/.oh-my-zsh"
alias ls="eza --group-directories-first --icons"
alias la="eza --group-directories-first -la --icons"
alias s="eza --group-directories-first --icons"
alias gl="git log --all --decorate --graph"
alias n="nvim"
alias ns="eza --oneline --only-files | fzf --reverse --preview \"bat {}\" | xargs -r nvim"
alias cat="bat --color=auto"
alias find="fd --color=auto"
alias grep="rg --color=auto"
alias dotfiles='/usr/bin/env git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Bind <C-z> to gf
fg-CTRL-z () {
  fg
}
zle -N fg-CTRL-z
bindkey '^Z' fg-CTRL-z

# Adding to path
path+=('/home/martinw/bin')

eval "$(setxkbmap -layout us,cz -variant ,ucw -option grp:switch,caps:swapescape)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
