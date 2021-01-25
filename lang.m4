__AUTHOR(⟦Josef Kubin⟧, ⟦2019,12,30⟧)
___DESCR(⟦converts LANG_CODE to numeric index and returns the required language item⟧)
__REASON(⟦selects item from multilingual list⟧)

# TODO: should be in a different file
# maps the language codes to indexes
# A → β
define(⟦LANG_INDEX_cs⟧, 1)
define(⟦LANG_INDEX_en⟧, 2)
define(⟦LANG_TOTAL_SUM⟧, 2)

# the script aborts, if an undefined lang code is set
ifdef(⟦LANG_INDEX_⟧LANG_CODE, ⟦⟧, ⟦

	ROOT_ERROR(⟦undefined LANG_CODE ‘⟧LANG_CODE⟦’, assign a new index⟧)
⟧)

# mono-lingual case (the processed macro contains only one entry for all languages)
# A → β
define(⟦SELECT_CASE_1⟧, ⟦patsubst(patsubst(⟦⟦⟦$1⟧⟧⟧, ⟦\s*\s*⟧), ⟦\<dnl\>\|#⟧, ⟦⟦\&⟧⟧)⟧)
define(⟦EXPAND_CASE_1⟧, ⟦patsubst(patsubst(⟦⟦$1⟧⟧, ⟦\s*\s*⟧), ⟦\<dnl\>\|#⟧, ⟦⟦\&⟧⟧)⟧)

# multi-lingual case (the processed macro contains several languages)
# A → β
# β
define(⟦SELECT_CASE_⟧LANG_TOTAL_SUM, ⟦patsubst(patsubst(⟧LL()LL()LL()$defn(⟦LANG_INDEX_⟧LANG_CODE)⟧⟧⟧⟦, ⟦\s*\s*⟧), ⟦\<dnl\>\|#⟧, ⟦⟦\&⟧⟧)⟧)
define(⟦EXPAND_CASE_⟧LANG_TOTAL_SUM, ⟦patsubst(patsubst(⟧LL()LL()$defn(⟦LANG_INDEX_⟧LANG_CODE)⟧⟧⟦, ⟦\s*\s*⟧), ⟦\<dnl\>\|#⟧, ⟦⟦\&⟧⟧)⟧)

# branches to {mono,multi}lingual case
# A → β
define(⟦SELECT_REQUIRED_ITEM⟧, ⟦ifdef(⟦SELECT_CASE_$#⟧, ⟦SELECT_CASE_$#($@)⟧, ⟦ROOT_ERROR(⟦the number of language entries is not consistent⟧)⟧)⟧)
define(⟦EXPAND_REQUIRED_ITEM⟧, ⟦ifdef(⟦EXPAND_CASE_$#⟧, ⟦EXPAND_CASE_$#($@)⟧, ⟦ROOT_ERROR(⟦the number of language entries is not consistent⟧)⟧)⟧)

# selects language
# Note: the selected text is _NOT_ processed through REGEX, the symbols ⟦,⟧, ⟦#⟧, ⟦dnl⟧ _WILL_ affects the trailing text
# A → β
define(⟦LANG⟧, LL()$defn(⟦LANG_INDEX_⟧LANG_CODE)⟧)
#
# a safer variant of the above macro:
# define(⟦LANG⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟧LL()LL()$defn(⟦LANG_INDEX_⟧LANG_CODE)⟧⟧⟦)⟧)

# selects language for inline text, the macro hides M4 symbols
# Note: the symbols ⟦,⟧, ⟦#⟧, ⟦dnl⟧ _WILL_NOT_ affects the subsequent text
# A → β
define(⟦LANG_REGEX⟧, ⟦patsubst(⟧LL()LL()$defn(⟦LANG_INDEX_⟧LANG_CODE)⟧⟧⟦, ⟦\<dnl\>\|[#,]⟧, ⟦⟦\&⟧⟧)⟧)
# a safer variant
# define(⟦LANG_REGEX⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟧LL()⟦patsubst(⟧LL()LL()$defn(⟦LANG_INDEX_⟧LANG_CODE)⟧⟧⟦, ⟦\<dnl\>\|[#,]⟧, ⟦⟦\&⟧⟧)⟧⟧⟦)⟧)

# selects language without leading and trailing white chars
# Note: the symbols ⟦#⟧, ⟦dnl⟧ _WILL_NOT_ affects the subsequent text
# A → β
define(⟦LANG_REGEX2⟧, defn(⟦SELECT_CASE_⟧LANG_TOTAL_SUM))
# a safer variant
# define(⟦LANG_REGEX2⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟧LL()defn(⟦SELECT_CASE_⟧LANG_TOTAL_SUM)⟧⟦)⟧)

# expands language (inline text)
# Note: the symbols ⟦,⟧, ⟦#⟧, ⟦dnl⟧ _WILL_NOT_ affects the subsequent text
# A → β
define(⟦XLANG_REGEX⟧, ⟦patsubst(⟧LL()$defn(⟦LANG_INDEX_⟧LANG_CODE)⟧⟦, ⟦\<dnl\>\|[#,]⟧, ⟦⟦\&⟧⟧)⟧)
# a safer variant
#define(⟦XLANG_REGEX⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟧LL()⟦patsubst(⟧LL()$defn(⟦LANG_INDEX_⟧LANG_CODE)⟧⟦, ⟦\<dnl\>\|[#,]⟧, ⟦⟦\&⟧⟧)⟧⟧⟦)⟧)

# expands language without leading and trailing white chars
# Note: the symbols ⟦#⟧, ⟦dnl⟧ _WILL_NOT_ affects the subsequent text
# A → β
define(⟦XLANG_REGEX2⟧, defn(⟦EXPAND_CASE_⟧LANG_TOTAL_SUM))
# a safer variant
#define(⟦XLANG_REGEX2⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟧LL()defn(⟦EXPAND_CASE_⟧LANG_TOTAL_SUM)⟧⟦)⟧)
