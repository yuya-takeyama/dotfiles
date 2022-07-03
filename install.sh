__dir__=$(cd $(dirname $0);pwd)

if [[ "$HOME" == "/home/codespace" ]]; then
  # In GitHub Codespaces
  echo "Running installation process for environments in GitHub Codespaces"
  for file in .tigrc .tmux.conf; do
    if [ -e $HOME/$file ]; then
      echo Delete $HOME/$file
      rm $HOME/$file
    fi

    ln -vs $__dir__/$file $HOME/$file
  done
elif
  # In the other environments
  echo "Running installation process for non-GitHub Codespaces environments"
  for file in .vim .vimrc .gitconfig .gitignore.global .screenrc .tigrc .tmux.conf; do
    if [ -e $HOME/$file ]; then
      echo Delete $HOME/$file
      rm $HOME/$file
    fi

    ln -vs $__dir__/$file $HOME/$file
  done
fi
