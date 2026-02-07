load_version_control() {
  autoload -Uz vcs_info
  precmd() { 
    vcs_info 
    echo
  }
  zstyle ":vcs_info:git:*" formats "%b"
}

path() {
  echo "%~"
}

git_info() {
  if [[ ${vcs_info_msg_0_} != "" ]]; then
    if [[ -n $(git status -s --ignore-submodules=dirty 2> /dev/null) ]]; then
      echo "~"
    else
      echo ""
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
  RPROMPT='$(path)$(git_info)' 
  command_result() {
    echo "%(?.%F{7}.%F{9}) > %k%f"
  }
}

main
