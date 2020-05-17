__HEADER([Josef Kubin], [2019/12/30], [root_cz])
___DESCR([converts LANG_CODE to numeric index and selects desired language item])
___POINT([selects item from multilingual list])

# if defined language code
ifdef([LANG_CODE], [], [

	ROOT_ERROR([set the -DLANG_CODE='??' on the command line])
])

# language
# A → β
# β
define([SELECT_LANG], LB()$defn([LANG_INDEX_]LANG_CODE)])
define([EXPAND_LANG], $defn([LANG_INDEX_]LANG_CODE))

# select language without trailing white chars
# A → β
# β
define([SELECT_LANG_WITHOUT_TRAILING_LF], [patsubst(]LB()LB()$defn([LANG_INDEX_]LANG_CODE)]][, [\s*])])

# expand language without trailing white chars
# A → β
define([EXPAND_LANG_WITHOUT_TRAILING_LF], [patsubst(]LB()$defn([LANG_INDEX_]LANG_CODE)][, [\s*])])

# select language
# A → β
define([LANG], [ifelse([$#], [0], [[$0]], ]LB()defn([SELECT_LANG])][)])

# select language without trailing white chars
# A → β
define([LANGW], [ifelse([$#], [0], [[$0]], ]LB()defn([SELECT_LANG_WITHOUT_TRAILING_LF])][)])

# expand language (used for language-dependent macros)
# A → β
define([XLANG], [ifelse([$#], [0], [[$0]], ]LB()defn([EXPAND_LANG])][)])
