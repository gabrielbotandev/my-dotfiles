# zsh-vi-mode calls this before plugin initialization.
# Keep cursor settings here so ZVM_* constants exist.
zvm_config() {
  ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BEAM
  ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
  ZVM_VISUAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK

  ZVM_VI_HIGHLIGHT_BACKGROUND=none
  ZVM_VI_HIGHLIGHT_FOREGROUND=none
  ZVM_VI_HIGHLIGHT_EXTRASTYLE=none
}

# zsh-vi-mode resets bindings during init, so custom bindings must be
# registered through this hook.
zvm_after_init() {
  bindkey '^[[1;5C' forward-word
  bindkey '^[[1;5D' backward-word

  (( $+widgets[_fzf_file_no_hidden] )) && bindkey '^F' _fzf_file_no_hidden
  (( $+widgets[autosuggest-toggle] )) && bindkey '^\' autosuggest-toggle

  (( $+widgets[history-substring-search-up] )) && bindkey '^[[A' history-substring-search-up
  (( $+widgets[history-substring-search-down] )) && bindkey '^[[B' history-substring-search-down
}
