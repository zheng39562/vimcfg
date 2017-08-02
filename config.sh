#! /bin/bash

function EchoHelp(){
    echo "usage : config.sh [install_type]";
    echo "";
    echo "Arguments :";
    echo "    install_type          [vim] or [exvim].";
}

function InstallMyShell(){
    # copy shell(python) script.
    cp -rf my_script ~/
}

function InstallVim(){
    if [ ! -f ~/.vim ] ; then 
        mkdir ~/.vim
    fi

    if [ ! -f ~/.vim/plugin ] ; then 
        mkdir -p ~/.vim/plugin
    fi

    cp ./vimrc ~/.vimrc
    cp ./my_plugin/my.vim ~/.vim/plugin/
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

    # bash_profile
    cp bash_profile ~/.bash_profile
    source ~/.bash_profile

    # tmux conf
    cp tmux.conf ~/.tmux.conf

    # gdb init
    cp gdbinit ~/.gdbinit

    $(InstallMyShell);
}

function InstallExvim(){
    EXVIM_PATH = ./exvim

    # tar idutils and make
    cd ${EXVIM_PATH} 
    tar -zxf idutils-4.6.tar.gz
    cd ./idutils-4.6
    ./configure --prefix=/usr/local/bin/
    make && sudo make install install

    # download and install exvim
    mkdir -p ~/code/exvim
    cd ${EXVIM_PATH}
    git clone https://github.com/exvim/main
    cd main/
    sh unix/install.sh

    cp ./vimrc ~/.vimrc
    cp ./my_plugin/my.vim ~/.vim/plugin/

    $(InstallMyShell);
}

if [ $# -lt 1 ] ; then
    $(EchoHelp);
elif [ "$1" == "vim" ] ; then 
    $(InstallVim);
elif [ "$1" == "exvim" ] ; then 
    $(InstallExvim);
else
    $(EchoHelp);
fi

exit;

