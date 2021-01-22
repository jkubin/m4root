__AUTHOR(⟦Josef Kubin⟧, ⟦2019,12,30⟧)
___DESCR(⟦converts LANG_CODE to numeric index and selects desired language item⟧)
__REASON(⟦selects item from multilingual list⟧)

# test language code (script aborts, if an undefined code is set)
ifdef(⟦LANG_INDEX_⟧LANG_CODE, ⟦⟧, ⟦

	ROOT_ERROR(⟦undefined LANG_CODE ‘⟧LANG_CODE⟦’, assign a new index⟧)
⟧)

# FIXME: should be in a different file
# maps the language codes to indexes
# A → β
define(⟦LANG_INDEX_cs⟧, 1)
define(⟦LANG_INDEX_en⟧, 2)
define(⟦LANG_INDEX_LAST⟧, 2)

# mono-lingual case (the processed macro contains only one entry for all languages)
# A → β
define(⟦SELECT_CASE_1⟧, ⟦patsubst(patsubst(⟦⟦⟦$1⟧⟧⟧, ⟦\s*\s*⟧), ⟦\<dnl\>\|#⟧, ⟦⟦\&⟧⟧)⟧)

# multi-lingual case (the processed macro contains several languages)
# A → β
# β
define(⟦SELECT_CASE_⟧LANG_INDEX_LAST, ⟦patsubst(patsubst(⟧LL()LL()LL()$defn(⟦LANG_INDEX_⟧LANG_CODE)⟧⟧⟧⟦, ⟦\s*\s*⟧), ⟦\<dnl\>\|#⟧, ⟦⟦\&⟧⟧)⟧)

# branches to {mono,multi}lingual case
# A → β
define(⟦SELECT_REQUIRED_ITEM⟧, ⟦ifdef(⟦SELECT_CASE_$#⟧, ⟦SELECT_CASE_$#⟧, ⟦ROOT_ERROR(⟦the number of language entries is not consistent⟧)⟧)⟧)

# mono-lingual case (the macro contains only one entry for all languages)
# A → β
define(⟦EXPAND_CASE_1⟧, ⟦patsubst(patsubst(⟦⟦$1⟧⟧, ⟦\s*\s*⟧), ⟦\<dnl\>\|#⟧, ⟦⟦\&⟧⟧)⟧)

# multi-lingual case (the macro contains several languages)
# A → β
define(⟦EXPAND_CASE_⟧LANG_INDEX_LAST, ⟦patsubst(patsubst(⟧LL()LL()$defn(⟦LANG_INDEX_⟧LANG_CODE)⟧⟧⟦, ⟦\s*\s*⟧), ⟦\<dnl\>\|#⟧, ⟦⟦\&⟧⟧)⟧)

# branches to {mono,multi}lingual macro
# A → β
define(⟦EXPAND_REQUIRED_ITEM⟧, ⟦ifdef(⟦EXPAND_CASE_$#⟧, ⟦EXPAND_CASE_$#⟧, ⟦ROOT_ERROR(⟦the number of language entries is not consistent⟧)⟧)⟧)

# selects language
# A → β
define(⟦LANG⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟧LL()LL()$defn(⟦LANG_INDEX_⟧LANG_CODE)⟧⟧⟦)⟧)

# selects language without leading and trailing white chars
# A → β
define(⟦LANGW⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟧LL()defn(⟦SELECT_CASE_⟧LANG_INDEX_LAST)⟧⟦)⟧)

# FIXME: the special symbols ⟦#⟧ and ⟦dnl⟧ must be protected!
# expands language (used for language-dependent macros)
# A → β
define(⟦XLANG⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟧LL()$defn(⟦LANG_INDEX_⟧LANG_CODE)⟧⟦)⟧)
