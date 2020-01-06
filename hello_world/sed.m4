# A → β
define([COMMENT_CHAR], [# a-r])
define([SET_OF_CHARS], defn([COMMENT_CHAR])[[:upper:]])

divert(0)dnl
[#] DONTE()
#
# usage:
# sed -f hello_world.sed <<< ''
# or
# echo | sed -f hello_world.sed

s/^/SYMBOL/
s/LB()defn([SET_OF_CHARS])]//g
s/^/[SYMBOL]: defn([SYMBOL]) ---> /
