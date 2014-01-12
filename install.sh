__dir__=$(cd $(dirname $0);pwd)

for file in .vim .vimrc .gitconfig .screenrc .tmux.conf; do
  if [ -e $HOME/$file ]; then
    echo Delete $HOME/$file
    rm $HOME/$file
  fi

  ln -vs $__dir__/$file $HOME/$file
done
