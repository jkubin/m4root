# vim:mps+=`\:'
#
# 2019/09/22 Josef Kubin
#
# original quotation marks

1{
# set vim modeline; write LOUD alert for unsuspecting users
s/^/dnl vim:mps+=`\\:'\ndnl\ndnl DO NOT EDIT! This file is generated automatically!\ndnl\n/
# use implicit quotation marks
s/changequote([^)]*)//
}

# change a specific additional pair of characters
/^define(\[\(BRAC\|NPRI\|UTFP\)\], \[/{s//define(`\1', `/; s/])$/')/; b}

s/\[/`/g
s/]/'/g

# necessary changes for unpaired characters
/^define(`LB', `.*$/s//define(`LB', `[')/
/^define(`RB', `.*$/s//define(`RB', `]')/

# ord(`) is 96; ord(') is 39
/^define(`LQ', .*$/s//define(`LQ', `ifelse(`$#', `0', ``$0'', `changequote([,])format([%c], 96)changequote`'')')/
/^define(`RQ', .*$/s//define(`RQ', `ifelse(`$#', `0', ``$0'', `changequote([,])format([%c], 39)changequote`'')')/

# set aliases
/define(`LL',/s/LB/LQ/
/define(`RR',/s/RB/RQ/
