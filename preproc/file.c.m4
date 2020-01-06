# ORDinary and SAFe macros have different expansion:

# A → β
define(`ORD', `$0_M4 RQ()SYMBOL`'RQ()')
define(`SAF', `ifelse(`$#', `0', ``$0'', `($1) * ($1)	/* $0_M4 SYMBOL */')')

divert(0)dnl
