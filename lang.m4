__HEADER(⟦Josef Kubin⟧, ⟦2019/12/30⟧)
___DESCR(⟦converts LANG_CODE to numeric index and selects desired language item⟧)
__REASON(⟦selects item from multilingual list⟧)

# map language codes to indexes
# A → β
define(⟦LANG_INDEX_cs⟧, 1)
define(⟦LANG_INDEX_en⟧, 2)

# test language code
ifdef(⟦LANG_INDEX_⟧LANG_CODE, ⟦⟧, ⟦

	ROOT_ERROR(⟦undefined LANG_CODE ‘⟧LANG_CODE⟦’, assign a new index⟧)
⟧)

# language
# A → β
# β
define(⟦SELECT_LANG⟧, LU()$defn(⟦LANG_INDEX_⟧LANG_CODE)⟧)
define(⟦EXPAND_LANG⟧, $defn(⟦LANG_INDEX_⟧LANG_CODE))

# select language without trailing white chars
# A → β
# β
define(⟦SELECT_LANG_WITHOUT_TRAILING_LF⟧, ⟦patsubst(⟧LU()LU()$defn(⟦LANG_INDEX_⟧LANG_CODE)⟧⟧⟦, ⟦\s*⟧)⟧)

# expand language without trailing white chars
# A → β
define(⟦EXPAND_LANG_WITHOUT_TRAILING_LF⟧, ⟦patsubst(⟧LU()$defn(⟦LANG_INDEX_⟧LANG_CODE)⟧⟦, ⟦\s*⟧)⟧)

# select language
# A → β
define(⟦LANG⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟧LU()defn(⟦SELECT_LANG⟧)⟧⟦)⟧)

# select language without trailing white chars
# A → β
define(⟦LANGW⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟧LU()defn(⟦SELECT_LANG_WITHOUT_TRAILING_LF⟧)⟧⟦)⟧)

# expand language (used for language-dependent macros)
# A → β
define(⟦XLANG⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟧LU()defn(⟦EXPAND_LANG⟧)⟧⟦)⟧)
