#! /bin/bash

function EchoHelp(){
    echo "usage : config.sh [optional]";
    echo "";
    echo "Arguments :";
    echo "    vim				: install vim";
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

	# install necessary software.
	sudo yum -y install vim
	sudo yum -y install clang-devel
	sudo yum -y install clang
	sudo yum -y install gcc-c++
	sudo yum -y install tmux
	sudo yum -y install automake

	vim +BundleInstall +qall

	# cpp regex.
	cp ./ctrlp_funky/cpp.vim ~/.vim/bundle/ctrlp-funky/autoload/ctrlp/funky/ft/

	# clang-complete vim:
	cd ~/.vim/bundle/clang-complete/
	make
	make install

}

if [ $# -lt 1 ] ; then
    EchoHelp;
elif [ "$1" == "vim" ] ; then 
    InstallVim
elif [ "$1" == "help" ] ; then 
    InstallExvim
else
    EchoHelp
fi

exit;

