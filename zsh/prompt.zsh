export VIRTUAL_ENV_DISABLE_PROMPT=1
FUNCNEST=100

if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi
