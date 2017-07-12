#! /bin/bash

/usr/bin/rm ~/base_include.tags
touch ~/base_include.tags
find /usr/include/ -iname '*.cc' -or -iname '*.c' -or -iname '*.cpp' -or -iname '*.hpp' -or -iname '*.h' | xargs ctags --c++-kinds=+p --fields=+iaS --extra=+q --langmap=c++:+.inl -a ~/base_include.tags
find /usr/local/include/ -iname '*.cc' -or -iname '*.c' -or -iname '*.cpp' -or -iname '*.hpp' -or -iname '*.h' | xargs ctags --c++-kinds=+p --fields=+iaS --extra=+q --langmap=c++:+.inl -a ~/base_include.tags

