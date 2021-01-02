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

# select language without trailing white chars
# A → β
# β
define(⟦SELECT_LANG_CROP_WHITE_CHARS⟧, ⟦patsubst(patsubst(⟧LL()LL()LL()$defn(⟦LANG_INDEX_⟧LANG_CODE)⟧⟧⟧⟦, ⟦\s*\s*⟧), ⟦\<dnl\>\|#⟧, ⟦⟦\&⟧⟧)⟧)

# expand language without trailing white chars
# A → β
define(⟦EXPAND_LANG_CROP_WHITE_CHARS⟧, ⟦patsubst(patsubst(⟧LL()LL()$defn(⟦LANG_INDEX_⟧LANG_CODE)⟧⟧⟦, ⟦\s*\s*⟧), ⟦\<dnl\>\|#⟧, ⟦⟦\&⟧⟧)⟧)

# select language
# A → β
define(⟦LANG⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟧LL()LL()$defn(⟦LANG_INDEX_⟧LANG_CODE)⟧⟧⟦)⟧)

# select language without trailing white chars
# A → β
define(⟦LANGW⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟧LL()defn(⟦SELECT_LANG_CROP_WHITE_CHARS⟧)⟧⟦)⟧)

# expand language (used for language-dependent macros)
# A → β
define(⟦XLANG⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟧LL()$defn(⟦LANG_INDEX_⟧LANG_CODE)⟧⟦)⟧)
