alias c='clear'
alias nf='fastfetch'

# Better ls
if command -v eza >/dev/null 2>&1; then
  alias ls='eza --icons'
  alias ll='eza -lh --icons --git'
  alias la='eza -lah --icons --git'
  alias tree='eza --tree --icons'
  compdef eza=ls
fi

# Better cat
if command -v bat >/dev/null 2>&1; then
  alias cat='bat'
fi

# Core utilities
if command -v rg >/dev/null 2>&1; then
  alias grep='rg --color=auto'
fi

alias diff='diff --color=auto'
alias df='df -h'

# Navigation
alias -- -='cd -'

lf() {
  if ! command -v lf >/dev/null 2>&1; then
    echo "lf is not installed."
    return 127
  fi

  local tmp dir
  tmp="$(mktemp)"
  command lf -last-dir-path="$tmp" "$@"

  if [[ -f "$tmp" ]]; then
    dir="$(cat "$tmp")"
    rm -f "$tmp"
    [[ -d "$dir" && "$dir" != "$PWD" ]] && cd "$dir"
  fi
}

# Editor
alias vim='nvim'

# Git
alias glog='PAGER="less -F -X" git log'
alias gadog='PAGER="less -F -X" git log --all --decorate --oneline --graph'
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# Video
alias stream='mpv av://v4l2:/dev/video4 --fullscreen --demuxer-lavf-o=input_format=mjpeg,framerate=30 --profile=low-latency --untimed'
