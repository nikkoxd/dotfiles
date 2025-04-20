load_version_control() {
  autoload -Uz vcs_info
  precmd() { 
    vcs_info 
    echo
  }
  zstyle ":vcs_info:git:*" formats "%b"
}

path() {
  echo "%F{blue}  %F{gray}%~%f"
}

git_info() {
  if [[ ${vcs_info_msg_0_} != "" ]]; then
    if [[ -n $(git status -s --ignore-submodules=dirty 2> /dev/null) ]]; then
      echo "  %F{gray}%{\x1b[3m%}${vcs_info_msg_0_}*%{\x1b[0m%}%f"
    else
      echo "  %F{gray}${vcs_info_msg_0_}%f"
    fi
  fi
}

git_dirty() {
  if [[ -n $(git status -s --ignore-submodules=dirty 2> /dev/null) ]]; then
    echo "%F{red}*%f"
  fi
}

vi_mode() {
  case $ZVM_MODE in
    "$ZVM_MODE_NORMAL")
      echo "[n]"
      ;;
    "$ZVM_MODE_VISUAL")
      echo "[v]"
      ;;
    "$ZVM_MODE_VISUAL_LINE")
      echo "[l]"
      ;;
    "$ZVM_MODE_REPLACE")
      echo "[r]"
      ;;
  esac
}

main() {
  load_version_control
  setopt PROMPT_SUBST
  PROMPT=' $(command_result) '
  RPROMPT='%K{black} $(path)  $(git_info)%K{black} %k' 
  command_result() {
    echo "%(?.%F{blue}.%F{red})%K{black} 󰅂 %k%f"
  }
}

main
