autoload -Uz colors && colors

autoload -Uz vcs_info
autoload -U add-zsh-hook

zstyle ':vcs_info:*' check-for-changes true

zstyle ':vcs_info:*' unstagedstr '%F{red}*'
zstyle ':vcs_info:*' stagedstr '%F{yellow}+'

zstyle ':vcs_info:*' actionformats '%F{green}─[%F{blue}%b%F{yellow}|%F{red}%a%c%u%m%F{green}]%f'
zstyle ':vcs_info:*' formats '%F{green}─[%F{blue}%b%c%u%m%F{green}]%f'

zstyle ':vcs_info:svn:*' branchformat '%b'
zstyle ':vcs_info:svn:*' actionformats '%F{green}─[%F{blue}%b%F{red}:%F{yellow}%i%F{yellow}|%F{red}%a%c%u%m%F{green}]%f'
zstyle ':vcs_info:svn:*' formats '%F{green}─[%F{blue}%b%F{red}:%F{yellow}%i%c%u%m%F{green}]%f'

zstyle ':vcs_info:*' enable git cvs svn
zstyle ':vcs_info:git*+set-message:*' hooks botan-untracked

+vi-botan-untracked() {
  if command git status --porcelain 2>/dev/null | command grep -q '??'; then
    hook_com[misc]='%F{red}?'
  else
    hook_com[misc]=''
  fi
}

botan_precmd() {
  vcs_info
}

add-zsh-hook precmd botan_precmd

PROMPT='%F{green}┌──[%B%F{blue}%n@%m%b%F{green}]─[%F{white}%c%F{green}]${vcs_info_msg_0_}%f
%F{green}└─%f%(!.%B%F{red}#.%B%F{blue}$)%k%b%f '
