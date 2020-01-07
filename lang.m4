__HEADER([Josef Kubin], [2019/12/30], [root_cz])
___DESCR([converts LANG_CODE to numeric index and selects desired language item])
___POINT([selects item from multilingual list])

# if defined language code
ifdef([LANG_CODE], [], [

	ROOT_ERROR([LANG_CODE is not defined. You have to define it on command line!])
])

# language
# A → β
define([SELECT_LANG], BRAC($defn([LANG_INDEX_]LANG_CODE)))
define([EXPAND_LANG], $defn([LANG_INDEX_]LANG_CODE))

# select language without trailing white chars
# A → β
define([SELECT_LANG_WITHOUT_TRAILING_LF], [patsubst(]BRAC(BRAC($defn([LANG_INDEX_]LANG_CODE)))[, [\s*])])
define([EXPAND_LANG_WITHOUT_TRAILING_LF], [patsubst(]BRAC($defn([LANG_INDEX_]LANG_CODE))[, [\s*])])

# select language
# A → β
define([LANG], [ifelse([$#], [0], [[$0]], ]BRAC(defn([SELECT_LANG]))[)])

# select language (without trailing white chars)
# A → β
define([LANGW], [ifelse([$#], [0], [[$0]], ]BRAC(defn([SELECT_LANG_WITHOUT_TRAILING_LF]))[)])

# expand language
# A → β
define([XLANG], [ifelse([$#], [0], [[$0]], ]BRAC(defn([EXPAND_LANG]))[)])
