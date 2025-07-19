load_version_control() {
  autoload -Uz vcs_info
  precmd() { 
    vcs_info 
    echo
  }
  zstyle ":vcs_info:git:*" formats "%b"
}

path() {
  echo "  %~%f"
}

git_info() {
  if [[ ${vcs_info_msg_0_} != "" ]]; then
    if [[ -n $(git status -s --ignore-submodules=dirty 2> /dev/null) ]]; then
      echo "    %{\x1b[3m%}${vcs_info_msg_0_}%F{9}*%{\x1b[0m%}%f"
    else
      echo "    ${vcs_info_msg_0_}%f"
    fi
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
  RPROMPT='%K{1} $(path)$(git_info)%K{1} %k' 
  command_result() {
    echo "%(?.%F{5}.%F{9})%K{1} 󰅂 %k%f"
  }
}

main
