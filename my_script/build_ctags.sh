#! /bin/bash

BASE_PATH=$1

if [ ! -n ${BASE_PATH} ]; then
	BASE_PATH="/usr/include/"
fi

/usr/bin/rm ~/base_include.tags
touch ~/base_include.tags
find ${BASE_PATH} -iname '*.c' -or -iname '*.cpp' -or -iname '*.hpp' -or -iname '*.h' | xargs ctags --c++-kinds=+p --fields=+iaS --extra=+q --langmap=c++:+.inl -a ~/base_include.tags

