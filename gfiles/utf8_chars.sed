# vim:mps+=〖\:〗
#
# __HEADER([Josef Kubin], [2019/09/22], [m4root])
# ___DESCR([converts the root file for square brackets to the root file for UTF-8 characters])
# ___POINT([root file for UTF-8 characters])
#
# some UTF-8 characters can be written as digraphs:
# 〖	Ctrl-k(I
# 〗	Ctrl-k)I

# set vim modeline; write LOUD alert for unsuspecting users
1s/^/dnl vim:mps+=〖\\:〗\ndnl\ndnl DO NOT EDIT! This file is generated automatically!\ndnl\n/

# change a specific additional pair of characters
/^define(\[\(BRAC\|NPRI\|QUOT\)\], \[/{s//define(〖\1〗, 〖/; s/])$/〗)/; b}

s/\[/〖/g
s/]/〗/g

# necessary changes for unpaired characters
/^\(define(〖LB〗, 〖\).*$/s//\1[〗)/
/^\(define(〖RB〗, 〖\).*$/s//\1]〗)/

# ord(〖) is 12310; ord(〗) is 12311
/^\(define(〖LU〗, 〖\).*$/s//\1ifelse(〖$#〗, 〖0〗, 〖〖$0〗〗, 〖changequote`'format(`%c%c%c', 227, 128, 150)changequote(〖,〗)〗)〗)/
/^\(define(〖RU〗, 〖\).*$/s//\1ifelse(〖$#〗, 〖0〗, 〖〖$0〗〗, 〖changequote`'format(`%c%c%c', 227, 128, 151)changequote(〖,〗)〗)〗)/

# set aliases
/define(〖LL〗,/s/LB/LU/
/define(〖RR〗,/s/RB/RU/
