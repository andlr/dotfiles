#!/bin/bash

readonly prog_name=$0

command -v git >/dev/null 2>&1 || { echo "Git is not installed"; exit 1; }

###############################################################

anim() {
  local i sp n
  sp='/-\|'
  n=${#sp}
  printf ' '
  while sleep 0.1; do
    printf "%s\b" "${sp:i++%n:1}"
  done
}

# Download with git ( arg1 = url | arg2 = path )
dl() {
  local pid
  echo -n "dl $1..."
  anim &
  pid=$!
  $(git clone $1 $2 2>/dev/null || exit 1)
  echo "[ok]"
  kill $pid # kill anim()
}

# Check if file exist else download ( arg1 = url | arg2 = path )
chk() {
  if [[ -d $2 ]] ; then
    echo "$2 is found"
  else
    dl $1 $2
  fi
}

forZsh() { 
  command -v zsh >/dev/null 2>&1 || { echo "Z shell is not installed"; exit 1; }
  chk https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
  chk https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  chk https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
}

forNeovim() {
  command -v nvim >/dev/null 2>&1 || { echo "Neovim is not installed"; exit 1; }
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

usage() {
  printf "%s\n" \
    "-z, --zsh    Download and install dependencies of zsh"

  printf "%s\n" \
    "-v, --neovim    Download and install dependencies of neovim"

  printf "%s\n" \
    "-h, --help   Display help"
}

###############################################################
# Command line options

if [ "$#" -eq 0 ]; then
  printf "%s\\n" "$prog_name: Argument required"
  printf "%s\\n" "Try '$prog_name --help' for more information."
  exit 1
fi

while [ "$#" -gt 0 ] ; do
  case "$1" in
    -z | --zsh)
      forZsh
      shift
      ;;
    -v | --neovim)
      forNeovim
      shift
      ;;
    -h | --help)
      usage
      shift
      ;;
    *)
      usage
      printf "\\n%s\\n" "$prog_name: Invalid option '$1'"
      exit 1
      ;;
  esac
done
