#! /bin/bash

function EchoHelp(){
    echo "usage : config.sh [optional]";
    echo "";
    echo "Arguments :";
    echo "    vim				: install vim";
    echo "    exvim				: install exvim";
    echo "    help-idutil		: echo idutil install manual";
}

function EchoIdutilManual(){
	echo "cd ./exvim"
    echo "tar -zxf idutils-4.6.tar.gz"
    echo "cd ./idutils-4.6"
    echo "./configure --prefix=/usr/local/bin"
    echo "make && sudo make install install"
}

function InstallVim(){
    if [ ! -f ~/.vim ] ; then 
        mkdir ~/.vim
    fi

    if [ ! -f ~/.vim/plugin ] ; then 
        mkdir -p ~/.vim/plugin
    fi

    cp ./vimrc ~/.vimrc
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

    # bash_profile
    cp bash_profile ~/.bash_profile
    source ~/.bash_profile

    # tmux conf
    cp tmux.conf ~/.tmux.conf

    # gdb init
    cp gdbinit ~/.gdbinit
}

function InstallExvim(){
    cp ./vimrc ~/.vimrc

    # download and install exvim
    mkdir -p ~/code/exvim
    cd ${EXVIM_PATH}
    git clone https://github.com/exvim/main
    cd main/
    sh unix/install.sh

	echo "Please check mkdi is exist or not. cmd is [which mkid]";
	echo "If it is not exist. You can input config.sh help-idutil. There is idutil install manual."
}

if [ $# -lt 1 ] ; then
    EchoHelp;
elif [ "$1" == "vim" ] ; then 
    InstallVim
elif [ "$1" == "exvim" ] ; then 
    InstallExvim
elif [ "$1" == "help" ] ; then 
    InstallExvim
elif [ "$1" == "help-idutil" ] ; then 
    EchoIdutilManual
else
    EchoHelp
fi

exit;

