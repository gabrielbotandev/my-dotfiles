ZPLUGINDIR="${ZDOTDIR:-$HOME/.config/zsh}/plugins"

_zplugin_load() {
  local user="$1"
  local repo="$2"
  local entry="$3"
  local plugin_path="$ZPLUGINDIR/$repo"

  if [[ ! -d "$plugin_path/.git" ]]; then
    mkdir -p "$ZPLUGINDIR"
    echo "Installing $repo..."
    git clone --depth=1 "https://github.com/$user/$repo" "$plugin_path" \
      || { echo "ERROR: failed to install $repo" >&2; return 1; }
  fi

  if [[ -r "$plugin_path/$entry" ]]; then
    source "$plugin_path/$entry"
  else
    echo "ERROR: missing plugin entry file: $plugin_path/$entry" >&2
    return 1
  fi
}

zplugin-update() {
  emulate -L zsh
  local dir

  for dir in "$ZPLUGINDIR"/*(/N); do
    echo "Updating ${dir:t}..."
    git -C "$dir" pull --ff-only
  done
}

_zplugin_load zsh-users zsh-autosuggestions zsh-autosuggestions.plugin.zsh
_zplugin_load zsh-users zsh-history-substring-search zsh-history-substring-search.plugin.zsh
_zplugin_load jeffreytse zsh-vi-mode zsh-vi-mode.plugin.zsh
_zplugin_load zdharma-continuum fast-syntax-highlighting fast-syntax-highlighting.plugin.zsh
