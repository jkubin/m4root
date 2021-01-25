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

# selects language, note: the selected text is _NOT_ processed through REGEX, the symbols ⟦,⟧ and ⟦#⟧ and ⟦dnl⟧ _WILL_ affects the trailing text
# A → β
define(⟦LANG⟧, LL()$defn(⟦LANG_INDEX_⟧LANG_CODE)⟧)
#
# a safer variant of the above macro:
# define(⟦LANG⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟧LL()LL()$defn(⟦LANG_INDEX_⟧LANG_CODE)⟧⟧⟦)⟧)

# expands language, note: the selected text is _NOT_ processed through REGEX, the symbols ⟦,⟧ and ⟦#⟧ and ⟦dnl⟧ _WILL_ affects the trailing text
# A → β
define(⟦XLANG⟧, $defn(⟦LANG_INDEX_⟧LANG_CODE))
#
# a safer variant of the above macro:
# define(⟦XLANG⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟧LL()LL()$defn(⟦LANG_INDEX_⟧LANG_CODE)⟧⟧⟦)⟧)

# selects language for inline text, the macro hides M4 symbols, note: the symbols ⟦,⟧ and ⟦#⟧ and ⟦dnl⟧ _WILL_NOT_ affects the subsequent text
# A → β
define(⟦LANG_RE⟧, ⟦patsubst(⟧LL()LL()$defn(⟦LANG_INDEX_⟧LANG_CODE)⟧⟧⟦, ⟦\<dnl\>\|[#,]⟧, ⟦⟦\&⟧⟧)⟧)
# a safer variant
# define(⟦LANG_RE⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟧LL()⟦patsubst(⟧LL()LL()$defn(⟦LANG_INDEX_⟧LANG_CODE)⟧⟧⟦, ⟦\<dnl\>\|[#,]⟧, ⟦⟦\&⟧⟧)⟧⟧⟦)⟧)

# selects language without leading and trailing white chars, note: the symbols ⟦#⟧ and ⟦dnl⟧ _WILL_NOT_ affects the subsequent text
# A → β
define(⟦LANG_RE2⟧, defn(⟦SELECT_CASE_⟧LANG_TOTAL_SUM))
# a safer variant
# define(⟦LANG_RE2⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟧LL()defn(⟦SELECT_CASE_⟧LANG_TOTAL_SUM)⟧⟦)⟧)

# expands language (inline text), note: the symbols ⟦,⟧ and ⟦#⟧ and ⟦dnl⟧ _WILL_NOT_ affects the subsequent text
# A → β
define(⟦XLANG_RE⟧, ⟦patsubst(⟧LL()$defn(⟦LANG_INDEX_⟧LANG_CODE)⟧⟦, ⟦\<dnl\>\|[#,]⟧, ⟦⟦\&⟧⟧)⟧)
# a safer variant
#define(⟦XLANG_RE⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟧LL()⟦patsubst(⟧LL()$defn(⟦LANG_INDEX_⟧LANG_CODE)⟧⟦, ⟦\<dnl\>\|[#,]⟧, ⟦⟦\&⟧⟧)⟧⟧⟦)⟧)

# expands language without leading and trailing white chars, note: the symbols ⟦#⟧ and ⟦dnl⟧ _WILL_NOT_ affects the subsequent text
# A → β
define(⟦XLANG_RE2⟧, defn(⟦EXPAND_CASE_⟧LANG_TOTAL_SUM))
# a safer variant
#define(⟦XLANG_RE2⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟧LL()defn(⟦EXPAND_CASE_⟧LANG_TOTAL_SUM)⟧⟦)⟧)
