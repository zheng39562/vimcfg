#! /bin/bash

# TODO: 
#	自动安装识别.
#	使用python作为安装脚本(shell也继续使用.)

function EchoHelp(){
    echo "usage : config.sh [optional]";
    echo "";
    echo "Arguments :";
    echo "    vim				: install vim";
}

function buildFolder(){
    if [ ! -f ~/other_code ] ; then 
        mkdir ~/other_code
    fi

    if [ ! -f ~/.vim ] ; then 
        mkdir ~/.vim
    fi

    if [ ! -f ~/.vim/plugin ] ; then 
        mkdir -p ~/.vim/plugin
    fi
}

function prepareWork(){
    # bash_profile
    cp bash_profile ~/.bash_profile
    source ~/.bash_profile

    # tmux conf
    cp tmux.conf ~/.tmux.conf

    # gdb init
    cp gdbinit ~/.gdbinit

	# install necessary software.
	sudo yum -y install clang-devel
	sudo yum -y install clang
	sudo yum -y install gcc-c++
	sudo yum -y install tmux
	sudo yum -y install automake
	sudo yum -y install ack
}

function InstallVimAndPlugin(){
	#======================================================
	# vim install(vim8.x)

	# support vim
#	sudo yum -y install lua lua-devel luajit luajit-devel git python36 python36-devel tcl-devel perl perl-devel perl-ExtUtils-ParseXS perl-ExtUtils-XSpp perl-ExtUtils-CBuilder perl-ExtUtils-Embed ncurses-devel

#	cd ~/other_code
#	git clone https://github.com/vim/vim.git
#	cd ./vim

	#Python3Dir=`sudo find /usr -name "config-3*gnu" | grep "python3"`
	#Python3Command=`sudo find /usr -name "python3[0-9]"`
	# TODO : python command 和 python dir 需要手工设置。后续考虑使用python生成shell的方式来解决自动化问题.
	# 核心问题是shell里面使用变量好像代替参数会有问题。 如果这个问题本身能解决，也可以不使用构建的方式.

#	cd ~/other_code/vim-8.2.0232/

#	make distclean
#	./configure --with-features=huge \ --enable-multibyte \ --enable-rubyinterp=yes \ --enable-python3interp=yes \ --with-python3-config-dir=/usr/lib64/python3.6/config-3.6m-x86_64-linux-gnu \ --with-python3-command=python3.6 \ --enable-perlinterp=yes \ --enable-luainterp=yes \ --enable-gui=gtk2 \ --enable-cscope \ --prefix=/usr/local

	#make VIMRUNTIMEDIR=/usr/local/share/vim/vim81 && sudo make install

	cp ./vimrc ~/.vimrc

	# autoload才能自动加载plug插件。否则需要手动复制.
	# TODO: 找到可以设置加载插件的方式(不过关系不大看情况做吧).
	#mkdir ~/.vim/autoload
	git clone https://github.com/junegunn/vim-plug.git ~/.vim/autoload/vim-plug
	cp ~/.vim/autoload/vim-plug/plug.vim ~/.vim/autoload/

	#vim +PlugInstall +qall
}

function InstallUniversalCtags(){
	cd ~/other_code
	git clone https://github.com/universal-ctags/ctags.git

	cd ./ctags
	./autogen.sh
	./configure
	make && sudo make install
}

function InstallPython3(){
	# pre install
	sudo yum install -y zlib* libffi-devel

	mkdir ~/other_code
	cd ~/other_code
	wget https://www.python.org/ftp/python/3.7.1/Python-3.7.1.tar.xz

	xz -d Python-3.7.1.tar.xz
	tar -xvf Python-3.7.1.tar
	cd Python-3.7.1

	./configure --prefix=/usr/local/ --enable-shared --enable-unicode=ucs4

	make

	sudo make install

	sudo ln -s /usr/local/python3/bin/python3 /usr/bin/python3
}

function InstallVim(){
#	buildFolder
	
	prepareWork

	#InstallVimAndPlugin
}

if [ $# -lt 1 ] ; then
    EchoHelp;
elif [ "$1" == "vim" ] ; then 
    InstallVim
elif [ "$1" == "help" ] ; then 
    EchoHelp
elif [ "$1" == "ctags" ] ; then 
    InstallUniversalCtags
elif [ "$1" == "python" ] ; then 
	InstallPython3
else
    EchoHelp
fi

exit;

