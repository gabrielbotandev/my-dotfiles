# Minimal modular zsh config based on Radley Lewis's layout, adapted for Fedora.

# =========================================================
# History
# =========================================================

HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=100000
SAVEHIST=100000

mkdir -p "${HISTFILE:h}" "$XDG_CACHE_HOME/zsh"

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

# =========================================================
# Shell behaviour
# =========================================================

setopt AUTOCD
setopt NOBEEP
setopt NUMERIC_GLOB_SORT

# =========================================================
# Smart directory navigation
# =========================================================

# Radley's repo assumes ~/.config/lf/icons exists; guard it for Fedora.
if [[ -r "$HOME/.config/lf/icons" ]]; then
  export LF_ICONS="$(tr '\n' ':' < "$HOME/.config/lf/icons")"
fi

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

# =========================================================
# Completion
# =========================================================

autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# =========================================================
# fzf shell integration
# =========================================================

# Fedora often uses /usr/share/fzf/shell; other distros use /usr/share/fzf
# or /usr/share/doc/fzf/examples. This keeps the config portable.
for fzf_dir in \
  /usr/share/fzf/shell \
  /usr/share/fzf \
  /usr/share/doc/fzf/examples \
  /opt/homebrew/opt/fzf/shell \
  /usr/local/opt/fzf/shell
do
  if [[ -r "$fzf_dir/key-bindings.zsh" || -r "$fzf_dir/completion.zsh" ]]; then
    [[ -r "$fzf_dir/key-bindings.zsh" ]] && source "$fzf_dir/key-bindings.zsh"
    [[ -r "$fzf_dir/completion.zsh" ]] && source "$fzf_dir/completion.zsh"
    break
  fi
done

# =========================================================
# Modular config files
# =========================================================

source "$ZDOTDIR/fzf.zsh"
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/bindings.zsh"
source "$ZDOTDIR/plugins.zsh"
source "$ZDOTDIR/prompt.zsh"

# Machine-local overrides; gitignored.
[[ -r "$ZDOTDIR/local.zsh" ]] && source "$ZDOTDIR/local.zsh"

# =========================================================
# Node / NVM
# =========================================================

export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"
