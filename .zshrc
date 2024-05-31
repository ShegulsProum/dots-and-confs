# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz compinit && compinit
### End of Zinit's installer chunk

#####################
# PROMPT            #
#####################
zinit ice from"gh-r" as"command" atload'eval "$(starship init zsh)"'
zinit load starship/starship
#####################
# DEF APPS CONF     #
#####################
zi ice as'null' from"gh-r" sbin
zi light ajeetdsouza/zoxide

zi ice as'command' from"gh-r" sbin
zi light junegunn/fzf

zinit ice from"gh-r" as"command" sbin"**/gh"
zinit light cli/cli

zinit ice as"command" from"gh-r" mv"bat* -> bat" pick"bat/bat"
zinit light sharkdp/bat

zinit ice as"command" from"gh-r" sbin'**\eza -> eza'
zinit light eza-community/eza

zinit ice as"command" from"gh-r" sbin
zinit light zellij-org/zellij
#####################
# Plugins           #
#####################

zinit light-mode for \
        zdharma-continuum/zinit-annex-as-monitor \
        zdharma-continuum/zinit-annex-bin-gem-node \
        zdharma-continuum/zinit-annex-patch-dl \
        zdharma-continuum/fast-syntax-highlighting \
        zsh-users/zsh-autosuggestions \
        zsh-users/zsh-completions \
	Aloxaf/fzf-tab \
	laggardkernel/zsh-thefuck \
	z-shell/zsh-zoxide

zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::dnf
zinit snippet OMZP::colored-man-pages

#####################
# ALIASES           #
#####################
alias ls="eza --tree --level=2 --icons=always --no-time --no-user --no-permissions --group-directories-first"
#alias cd="z"

#####################
# ZSTYLE            #
#####################

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color --icons=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

#####################
# EVALS             #
#####################

eval "$(fzf --zsh)"
eval "$(zellij setup --generate-auto-start zsh)"
