# Francesco's
# ZSH Configuration
# boosted by oh-my-zsh

# ---- Base Configuration ----

# -- Homebrew --
# Homebrew Path
export PATH="/opt/homebrew/bin:$PATH"

# -- ZSH / oh-my-zsh --
# Path to the oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH Theme
# For a full list see https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="kolo"

HYPHEN_INSENSITIVE="true" # _ and - will be interchangeable.
zstyle ':omz:update' mode auto # update automatically without asking
ENABLE_CORRECTION="true"

# ZSH Plugins
plugins=(
    git
    zoxide
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh


# ---- User Configuration ----

# -- Aliases --
# Navigation the file system
alias l="eza -l --all --git --git-repos"
alias cat="bat"
alias ct="bat"

# Code Editor
alias code="zed"

# Kubernetes
alias k='kubectl'


# ---- Tooling Configuration ----

# -- zoxide --
eval "$(zoxide init zsh)"

# -- pnpm --
export PNPM_HOME="/Users/fscheffczyk/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# -- nvm --
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# -- kubectl --
source <(kubectl completion zsh)
complete -o default -F __start_kubectl k

# -- pyenv --
eval "$(pyenv init --path)"
