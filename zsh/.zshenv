# XDG base directories
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

# Editor
export EDITOR="${EDITOR:-nvim}"
export VISUAL="${VISUAL:-nvim}"

# Pager
if command -v bat >/dev/null 2>&1; then
  export MANPAGER="bat -l man -p"
fi

# GPG
if [[ -t 0 ]]; then
  export GPG_TTY="$(tty)"
fi

# Starship
export STARSHIP_CONFIG="$ZDOTDIR/starship.toml"

# SSH agent socket, matching your current setup
if [[ -n "$XDG_RUNTIME_DIR" && -S "$XDG_RUNTIME_DIR/ssh-agent.socket" ]]; then
  export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
fi

# PATH
export PATH="$HOME/.local/bin:$PATH"
