# vim:mps+=⟦\:⟧
#
# __HEADER([Josef Kubin], [2019/09/22], [m4root])
# ___DESCR([converts the root file for square brackets to the root file for UTF-8 characters])
# __REASON([root file for UTF-8 characters])
#
# some UTF-8 characters can be written as digraphs:
# ⟦	Ctrl-k(I
# ⟧	Ctrl-k)I

# set vim modeline; write LOUD alert for unsuspecting users
1s/^/dnl vim:mps+=⟦\\:⟧\ndnl\ndnl DO NOT EDIT! This file is generated automatically!\ndnl\n/

# change a specific additional pair of characters
/^define(\[\(BRAC\|NPRI\|QUOT\)\], \[/{s//define(⟦\1⟧, ⟦/; s/])$/⟧)/; b}

s/\[/⟦/g
s/]/⟧/g

# necessary changes for unpaired characters
/^\(define(⟦LB⟧, ⟦\)ifelse.*$/s//\1[⟧)/
/^\(define(⟦RB⟧, ⟦\)ifelse.*$/s//\1]⟧)/

# echo -n '⟦⟧' | hexdump -e ' 1/1 "%d, "'
# echo -n '⟦⟧' | od -t u1
/^\(define(⟦LU⟧, ⟦\).*$/s//\1ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦changequote`'format(`%c%c%c', 226, 159, 166)changequote(⟦,⟧)⟧)⟧)/
/^\(define(⟦RU⟧, ⟦\).*$/s//\1ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦changequote`'format(`%c%c%c', 226, 159, 167)changequote(⟦,⟧)⟧)⟧)/

# for simplified root0b
# 
/^define(⟦LB⟧, ⟦changequote.*$/s//define(⟦LU⟧, ⟦changequote`'format(`%c%c%c', 226, 159, 166)changequote(⟦,⟧)⟧)/
/^define(⟦RB⟧, ⟦changequote.*$/s//define(⟦RU⟧, ⟦changequote`'format(`%c%c%c', 226, 159, 167)changequote(⟦,⟧)⟧)/

# set aliases
/define(⟦LL⟧,/s/LB/LU/
/define(⟦RR⟧,/s/RB/RU/
