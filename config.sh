#! /bin/bash

if [ -f ~/.vim ] ; then 
    mkdir ~/.vim
fi

mv ./vimrc ~/.vimrc
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

exit;
