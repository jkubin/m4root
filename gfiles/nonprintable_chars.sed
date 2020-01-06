# vim:mps+=\:
#
# 2019/09/22 Josef Kubin
#
# non printable chars  and  can be easily typed from Vim
# 	Ctrl-b	as _b_eginning
# 	Ctrl-f	as _f_inal or _f_inish

# set vim modeline; write LOUD alert for unsuspecting users
1s/^/dnl vim:mps+=\\:\ndnl\ndnl DO NOT EDIT! This file is generated automatically!\ndnl\n/

# change a specific additional pair of characters
/^define(\[\(BRAC\|QUOT\|UTFP\)\], \[/{s//define(\1, /; s/])$/)/; b}

s/\[//g
s/]//g

# necessary changes for unpaired characters
/^\(define(LB, \).*$/s//\1[)/
/^\(define(RB, \).*$/s//\1])/

# ord() is 2; ord() is 6 
/^\(define(LN, \).*$/s//\1ifelse($#, 0, $0, changequote`'format(`%c', 2)changequote(,)))/
/^\(define(RN, \).*$/s//\1ifelse($#, 0, $0, changequote`'format(`%c', 6)changequote(,)))/

# set aliases
/^define(LL,/s/LB/LN/
/^define(RR,/s/RB/RN/
