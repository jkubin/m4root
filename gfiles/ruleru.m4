dnl vim:mps+=〖\:〗
dnl
dnl DO NOT EDIT! This file is generated automatically!
dnl
__HEADER(〖Josef Kubin〗, 〖2019/11/16〗, 〖root〗)
___DESCR(〖check the length of the string by look (for the purpose of shortening)〗)
___POINT(〖string truncation by a computer is hardly acceptable〗)
___USAGE(〖m4 root.m4 ruler.m4 ...〗)

# ruler as an automaton
#      ______      _______ 
# --->/ INIT \--->/ PRINT \
#     \______/    \_______/
#

# A → β
define(〖📏dec〗, 〖ifelse(〖$1〗, 〖1〗, 〖1〗, 〖indir(〖$0〗, decr($1))〖〗eval($1 % 10)〗)〗)

# β
define(〖RULER_DEC〗, defn(〖TEST_ATM〗)〖

	# generate ruler and transition to the next node (PRINT)
	define(〖$0〗, indir(〖📏dec〗, $1))
〗)

# A → β
define(〖📏hex〗, 〖ifelse(〖$1〗, 〖1〗, 〖1〗, 〖indir(〖$0〗, decr($1))〖〗eval($1 % 16, 16)〗)〗)

# β
define(〖RULER_HEX〗, defn(〖TEST_ATM〗)〖

	# generate ruler and transition to the next node (PRINT)
	define(〖$0〗, indir(〖📏hex〗, $1))
〗)
