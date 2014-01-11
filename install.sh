__dir__=$(cd $(dirname $0);pwd)

for file in .vim .vimrc .gitconfig .screenrc .tmux.conf; do
  if [ -e ~/$file ]; then
    echo Delete ~/$file
    rm ~/$file
  fi

  ln -vs $__dir__/$file ~/$file
done

vim -c 'NeoBundleInstall!' -c 'q'
