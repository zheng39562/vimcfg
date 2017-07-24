#! /bin/bash

rm ~/base_include.tags
touch ~/base_include.tags
find /usr/include -iname "*.c" -or -iname "*.h" -or -iname "*.hpp" -or -iname "*.cpp" | xargs ctags --c++-kinds=+p --fields=+iaS --extra=+q --langmap=c++:+.inl -a -o ~/base_include.tags
find /usr/local/include -iname "*.c" -or -iname "*.h" -or -iname "*.hpp" -or -iname "*.cpp" | xargs ctags --c++-kinds=+p --fields=+iaS --extra=+q --langmap=c++:+.inl -a -o ~/base_include.tags

exit;

