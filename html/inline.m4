# vim:ts=20:sw=20

__HEADER(⟦Josef Kubin⟧, ⟦2019/12/28⟧)
___DESCR(⟦inline elements and unpaired tags with a subset of global attributes⟧)
__REASON(⟦definition of HTML5 inline elements and unpaired tags⟧)

# WARNING: keep 1:1 consistency: spell.m4 text.m4 man.m4 info.m4

# global attributes for most tags
# β
pushdef(⟦TITLE_2⟧,		⟦⟦⟧ifelse(⟦$2⟧, ⟦⟧, ⟦⟧, ⟦ title="⟦$2⟧"⟧)⟧)
pushdef(⟦XTITLE_2⟧,		⟦⟦⟧ifelse(⟦$2⟧, ⟦⟧, ⟦⟧, ⟦ title="$2"⟧)⟧)
pushdef(⟦CLASS_3⟧,		⟦ifelse(⟦$3⟧, ⟦⟧, ⟦⟧, ⟦ class="ADD_CLASS(⟦$3⟧)"⟧)⟧)
pushdef(⟦CLASS_3_EXPLAIN⟧,	⟦ class="ADD_CLASS(⟦xp⟧)⟦⟧ifelse(⟦$3⟧, ⟦⟧, ⟦⟧, ⟦ ADD_CLASS(⟦$3⟧)⟧)"⟧)
pushdef(⟦STYLE_4⟧,		⟦ifelse(⟦$4⟧, ⟦⟧, ⟦⟧, ⟦ style="⟦$4⟧"⟧)⟧)
pushdef(⟦ID_5⟧,		⟦ifelse(⟦$5⟧, ⟦⟧, ⟦⟧, ⟦ id="ADD_ID_ANCH(⟦$5⟧)"⟧)⟧)
pushdef(⟦ANYTHING_6⟧,	⟦ifelse(⟦$6⟧, ⟦⟧, ⟦⟧, ⟦ ⟦$6⟧⟧)⟧)

# global attributes group
# β
pushdef(⟦HTML_GLOBAL_ATTRIBUTES⟧,	defn(⟦TITLE_2⟧, ⟦CLASS_3⟧, ⟦STYLE_4⟧, ⟦ID_5⟧, ⟦ANYTHING_6⟧))

# custom macros for convenience
# A → β
#define(⟦BUN⟧,		⟦BOLD(⟦$1⟧, ⟦$2⟧, ⟦un⟧)⟧)
#define(⟦CODE_BLUE⟧,	⟦XCODE(⟦$1⟧, ⟦$2⟧, ⟦bl⟧)⟧)
#define(⟦CODE_UND⟧,		⟦XCODE(⟦$1⟧, ⟦$2⟧, ⟦un⟧)⟧)
define(⟦EXPLAIN⟧,		⟦SPAN(⟦$1⟧, ⟦$2⟧, ⟦xp⟧)⟧)
define(⟦EXPLAIN_CODE⟧,	⟦CODE(⟦$1⟧, ⟦$2⟧, ⟦xp⟧)⟧)
define(⟦EXPLAIN_XCODE⟧,	⟦XCODE(⟦$1⟧, ⟦$2⟧, ⟦xp⟧)⟧)
define(⟦MM⟧,		⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦<span class="NSP()$2">$1</span>⟧)⟧)	<--- mnemonic: Marking Macro

# built-in styles for root.cz
# A → β
define(⟦GRAY⟧,	⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟧PAYR(⟦<span class="rs-note"⟧defn(⟦TITLE_2⟧)⟦>$1</span>⟧)⟦)⟧)
define(⟦PERSON⟧,	⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟧PAYR(⟦<span class="rs-person"⟧defn(⟦TITLE_2⟧)⟦>$1</span>⟧)⟦)⟧)

# unpaired tags
# A → β
define(⟦BR⟧,	⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦<br>⟧)⟧)
define(⟦WBR⟧,	⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦<wbr>⟧)⟧)

# how to use ULINK(…)
#
# ULINK	---> ULINK
# ULINK (…)	---> ULINK (…)
# ULINK(⟦URL⟧)	---> <a href="URL">URL</a>
# ULINK(⟦text⟧, ⟦URL⟧)	---> <a href="URL">text</a>
# ULINK(⟦text⟧, ⟦my_title⟧, ⟦URL⟧)	---> <a href="URL" title="my_title">text</a>
# ULINK(⟦text⟧, ⟦my_title⟧,,,, ⟦my_rel⟧, ⟦URL⟧)	---> <a href="URL" title="my_title" rel="my_rel">text</a>
# ULINK(⟦text⟧, ⟦my_title⟧, ⟦my_class⟧, ⟦URL⟧)	---> <a href="URL" title="my_title" class="my_class">text</a>
# ULINK(⟦text⟧, ⟦⟧, ⟦my_class⟧, ⟦URL⟧)	---> <a href="URL" class="my_class">text</a>
# ULINK(⟦text⟧,,,,, ⟦my_rel⟧, ⟦URL⟧)	---> <a href="URL" rel="my_rel">text</a>
# ULINK(⟦text⟧,,,,,, ⟦foo="bar" baz="ham"⟧, ⟦URL⟧)	---> <a href="URL" foo="bar" baz="ham">text</a>
# ULINK(⟦text⟧, ⟦my_title⟧, ⟦my_class⟧, ⟦my_style⟧, ⟦URL⟧)	---> <a href="URL" title="my_title" class="my_class" style="my_style">text</a>
# ULINK(⟦text⟧, ⟦my_title⟧, ⟦my_class⟧,, ⟦my_id⟧, ⟦URL⟧)	---> <a href="URL" title="my_title" class="my_class" id="my_id">text</a>
# ULINK(⟦text⟧, ⟦my_title⟧, ⟦my_class⟧,,, ⟦my_rel⟧, ⟦URL⟧)	---> <a href="URL" title="my_title" class="my_class" rel="my_rel">text</a>
# β
pushdef(⟦VAR_TITLE_2⟧,	⟦ifelse(⟦$#⟧, ⟦2⟧, ⟦⟧, ⟦$2⟧, ⟦⟧, ⟦⟧, ⟦ title="⟦$2⟧"⟧)⟧)
pushdef(⟦VAR_CLASS_3⟧,	⟦ifelse(⟦$#⟧, ⟦3⟧, ⟦⟧, ⟦$3⟧, ⟦⟧, ⟦⟧, ⟦ class="ADD_CLASS(⟦$3⟧)"⟧)⟧)
pushdef(⟦VAR_CLASS_3_HGL⟧,	⟦ class="ADD_CLASS(⟦hgl⟧)⟦⟧ifelse(⟦$#⟧, ⟦3⟧, ⟦⟧, ⟦$3⟧, ⟦⟧, ⟦⟧, ⟦ ADD_CLASS(⟦$3⟧)⟧)"⟧)
pushdef(⟦VAR_STYLE_4⟧,	⟦ifelse(⟦$#⟧, ⟦4⟧, ⟦⟧, ⟦$4⟧, ⟦⟧, ⟦⟧, ⟦ style="⟦$4⟧"⟧)⟧)
pushdef(⟦VAR_ID_5⟧,		⟦ifelse(⟦$#⟧, ⟦5⟧, ⟦⟧, ⟦$5⟧, ⟦⟧, ⟦⟧, ⟦ id="ADD_ID_ANCH(⟦$5⟧)"⟧)⟧)
pushdef(⟦VAR_REL_6⟧,	⟦ifelse(⟦$#⟧, ⟦6⟧, ⟦⟧, ⟦$6⟧, ⟦⟧, ⟦⟧, ⟦ rel="⟦$6⟧"⟧)⟧)
pushdef(⟦VAR_ANYTHING_6⟧,	⟦ifelse(⟦$#⟧, ⟦6⟧, ⟦⟧, ⟦$6⟧, ⟦⟧, ⟦⟧, ⟦ ⟦$6⟧⟧)⟧)
pushdef(⟦VAR_ANYTHING_7⟧,	⟦ifelse(⟦$#⟧, ⟦7⟧, ⟦⟧, ⟦$7⟧, ⟦⟧, ⟦⟧, ⟦ ⟦$7⟧⟧)⟧)

# this is an example, how to solve the problem of excessive commas (how not to fall into a coma :-)
#define(⟦ULINK_TWO⟧,	⟦ULINK(⟦$1⟧, ifelse(⟦$#⟧, ⟦2⟧, ⟦⟧, ⟦⟦$2⟧⟧),,,, ifelse(⟦$#⟧, ⟦3⟧, ⟦⟧, ⟦⟦$3⟧⟧), ⟧defn(⟦SELECT_LAST_ARG⟧)⟦)⟧)
# how to use ULINK_TWO(…), an example how to reduce the amount of commas
#
# ULINK_TWO(⟦URL⟧)	---> <a href="URL">URL</a>
# ULINK_TWO(⟦text⟧, ⟦URL⟧)	---> <a href="URL">text</a>
# ULINK_TWO(⟦text⟧, ⟦my_title⟧, ⟦URL⟧)	---> <a href="URL" title="my_title">text</a>
# ULINK_TWO(⟦text⟧, ⟦my_title⟧, ⟦my_rel⟧, ⟦URL⟧)	---> <a href="URL" title="my_title" rel="my_rel">text</a>
# ULINK_TWO(⟦text⟧,, ⟦my_rel⟧, ⟦URL⟧)	---> <a href="URL" rel="my_rel">text</a>

# β
pushdef(⟦MAKE_INLINE_ELEMENT⟧,		⟦define(⟦$1⟧, ⟦ifelse($⟧⟦#, 0, ⟧PAYR(PAYR($⟦0⟧))⟦, ⟧PAYR(⟦<$2⟧defn(⟦HTML_GLOBAL_ATTRIBUTES⟧)⟦>$⟧⟦1</$2>⟧)⟦)⟧)⟧)
pushdef(⟦MAKE_INLINE_ELEMENT_EXPAND⟧,		⟦define(⟦$1⟧, ⟦ifelse($⟧⟦#, 0, ⟧PAYR(PAYR($⟦0⟧))⟦, ⟧PAYR(⟦<$2⟧defn(⟦XTITLE_2⟧, ⟦CLASS_3⟧, ⟦STYLE_4⟧, ⟦ID_5⟧, ⟦ANYTHING_6⟧)⟦>$⟧⟦1</$2>⟧)⟦)⟧)⟧)
pushdef(⟦MAKE_INLINE_ELEMENT_SPECIAL⟧,	⟦define(⟦$1⟧, ⟦ifelse($⟧⟦#, 0, ⟧PAYR(PAYR($⟦0⟧))⟦, ⟧PAYR(⟦$2⟧)⟦)⟧)⟧)

# MAKE_INLINE_ELEMENT_EXPAND(⟦XSPAN⟧,	⟦span⟧)	<--- expands title
MAKE_INLINE_ELEMENT(⟦ABBREV⟧,	⟦abbr⟧)
MAKE_INLINE_ELEMENT(⟦ACRONYM⟧,	⟦acronym⟧)
MAKE_INLINE_ELEMENT(⟦BOLD⟧,	⟦b⟧)
MAKE_INLINE_ELEMENT(⟦BUTTON⟧,	⟦button⟧)
MAKE_INLINE_ELEMENT(⟦CITATION⟧,	⟦cite⟧)
MAKE_INLINE_ELEMENT(⟦XCODE⟧,	⟦code⟧)
MAKE_INLINE_ELEMENT(⟦DEFINITION⟧,	⟦dfn⟧)
MAKE_INLINE_ELEMENT(⟦DELETED⟧,	⟦del⟧)
MAKE_INLINE_ELEMENT(⟦EMPHASIS⟧,	⟦em⟧)
MAKE_INLINE_ELEMENT(⟦INSERTED⟧,	⟦ins⟧)
MAKE_INLINE_ELEMENT(⟦ITALIC⟧,	⟦i⟧)
MAKE_INLINE_ELEMENT(⟦LABEL⟧,	⟦label⟧)
MAKE_INLINE_ELEMENT(⟦LI⟧,	⟦li⟧)
MAKE_INLINE_ELEMENT(⟦MARK⟧,	⟦mark⟧)
MAKE_INLINE_ELEMENT(⟦METER⟧,	⟦meter⟧)
MAKE_INLINE_ELEMENT(⟦OL⟧,	⟦ol⟧)
MAKE_INLINE_ELEMENT(⟦PROGRESS⟧,	⟦progress⟧)
MAKE_INLINE_ELEMENT(⟦QUOTE⟧,	⟦q⟧)
MAKE_INLINE_ELEMENT(⟦SAMP⟧,	⟦samp⟧)
MAKE_INLINE_ELEMENT(⟦SMALL⟧,	⟦small⟧)
MAKE_INLINE_ELEMENT(⟦SPAN⟧,	⟦span⟧)
MAKE_INLINE_ELEMENT(⟦STRIKETHROUGH⟧,	⟦s⟧)
MAKE_INLINE_ELEMENT(⟦STRONG⟧,	⟦strong⟧)
MAKE_INLINE_ELEMENT(⟦SUBSCRIPT⟧,	⟦sub⟧)
MAKE_INLINE_ELEMENT(⟦SUPERSCRIPT⟧,	⟦sup⟧)
MAKE_INLINE_ELEMENT(⟦TIME⟧,	⟦time⟧)
MAKE_INLINE_ELEMENT(⟦UL⟧,	⟦ul⟧)
MAKE_INLINE_ELEMENT(⟦UNDERLINE⟧,	⟦u⟧)
MAKE_INLINE_ELEMENT(⟦VARIABLE⟧,	⟦var⟧)
MAKE_INLINE_ELEMENT_SPECIAL(⟦CODE⟧,	⟦<code⟧defn(⟦HTML_GLOBAL_ATTRIBUTES⟧)⟦>⟦$1⟧</code>⟧)
MAKE_INLINE_ELEMENT_SPECIAL(⟦ULINK⟧,	⟦<a href="⟧defn(⟦SELECT_LAST_ARG⟧)"defn(⟦VAR_TITLE_2⟧, ⟦VAR_CLASS_3⟧, ⟦VAR_STYLE_4⟧, ⟦VAR_ID_5⟧, ⟦VAR_REL_6⟧, ⟦VAR_ANYTHING_7⟧)⟦>$1</a>⟧)

# keyword to highlight line(s) in source code
# how to use:
# HCODE(⟦keyword⟧, ⟦⟦⟦1, 2, 3⟧, ⟦reference_to_preformatted_code⟧⟧⟧)
# HCODE(⟦keyword⟧, ⟦my title⟧, ⟦⟦⟦1, 2, 3⟧, ⟦reference_to_preformatted_code⟧⟧⟧)
# HCODE(⟦keyword⟧, ⟦my title⟧, ⟦my_class⟧, ⟦⟦⟦1, 2, 3⟧, ⟦reference_to_preformatted_code⟧⟧⟧)
# ...
# HCODE(⟦keyword⟧, ⟦⟦⟦1, 2, 3⟧, ⟦path/file.x⟧⟧⟧)
# HCODE(⟦keyword⟧, ⟦my title⟧, ⟦⟦⟦1, 2, 3⟧, ⟦path/file.x⟧⟧⟧)
# HCODE(⟦keyword⟧, ⟦my title⟧, ⟦my_class⟧, ⟦⟦⟦1, 2, 3⟧, ⟦path/file.x⟧⟧⟧)
# ...

# β
pushdef(⟦BETA1⟧, ⟦pushdef(⟦CURRQU⟧, divnum)divert(-1)

	ifelse(eval(⟦$# < 2⟧), ⟦1⟧, ⟦

		ROOT_ERROR(⟦the $0(…) requires at least 2 arguments⟧)
	⟧)

	MAKE_DATASET(dnl
⟧)

# β
pushdef(⟦BETA2⟧, ⟦)

divert(CURRQU)dnl
<$0_TAG⟦⟧⟧)

# β
pushdef(⟦BETA3⟧, ⟦defn(⟦DATA_SET⟧)>$1</$0_TAG>popdef(⟦CURRQU⟧, ⟦DATA_SET_KEY⟧, ⟦DATA_SET⟧)⟧)
pushdef(⟦BETA4⟧, ⟦defn(⟦DATA_SET⟧)>⟦$1⟧</$0_TAG>popdef(⟦CURRQU⟧, ⟦DATA_SET_KEY⟧, ⟦DATA_SET⟧)⟧)
pushdef(⟦SUPER_BETA⟧, defn(⟦BETA1⟧, ⟦EXPAND_LAST_ARG⟧, ⟦BETA2⟧, ⟦VAR_TITLE_2⟧, ⟦VAR_CLASS_3_HGL⟧, ⟦VAR_STYLE_4⟧, ⟦VAR_ID_5⟧, ⟦VAR_ANYTHING_6⟧))

# A → β
define(⟦HCODE⟧, defn(⟦SUPER_BETA⟧, ⟦BETA4⟧))
define(⟦HEXPLAIN⟧, defn(⟦SUPER_BETA⟧, ⟦BETA3⟧))
define(⟦HXCODE⟧, defn(⟦SUPER_BETA⟧, ⟦BETA3⟧))

# A → β
define(⟦HCODE_TAG⟧, ⟦code⟧)
define(⟦HEXPLAIN_TAG⟧, ⟦span⟧)
define(⟦HXCODE_TAG⟧, ⟦code⟧)

# A → β
define(⟦REMOVE_SPACES⟧,	⟦translit(⟦⟦$1⟧⟧, ⟦ ⟧)⟧)
define(⟦SELECT_ARG2⟧,	⟦⟦$2⟧⟧)

# A → β
define(⟦MAKE_DATASET⟧, ⟦

	ifelse(⟦$1⟧, ⟦⟧, ⟦⟧, ⟦

		# find the record in the hash database of references
		define(⟦DATA_SET_KEY⟧, defn(__file__.dset.SELECT_ARG2($1)))

		ifelse(defn(⟦DATA_SET_KEY⟧), ⟦⟧, ⟦

			ROOT_WARNING(⟦the key ‘⟧__file__.dset.SELECT_ARG2($1)⟦’ not found, fix your reference or run ‘make -B refs …’ to regenerate reference list⟧)
		⟧)

		define(⟦DATA_SET⟧, defn(⟦DATA_SET⟧) data-defn(⟦DATA_SET_KEY⟧)="REMOVE_SPACES(SARG1($1))")

		$0(shift($@))
	⟧)
⟧)

# a hyperlink to a paragraph, code, headline, …, even into other html page in different language
# LINK(⟦hyperlink⟧, ⟦INTERNAL_ID⟧)
# LINK(⟦hyperlink⟧, ⟦EXTERNAL_ID⟧, ⟦source.mc⟧)
# LINK(⟦hyperlink to another language⟧, ⟦EXTERNAL_ID⟧, ⟦source.mc⟧, ⟦en⟧)
#
# both IDs must be the same in order to copy text from the another caption
# LINK(⟦INTERNAL_ID⟧, ⟦INTERNAL_ID⟧)
# LINK(⟦EXTERNAL_ID⟧, ⟦EXTERNAL_ID⟧, ⟦source.mc⟧)
# LINK(⟦EXTERNAL_ID⟧, ⟦EXTERNAL_ID⟧, ⟦source.mc⟧, ⟦en⟧)
# A → β
define(⟦LINK⟧, ⟦pushdef(⟦CURRQU⟧, divnum)divert(-1)

	# the more arguments the more link capabilities
	ifelse(
		⟦$#⟧, ⟦2⟧, ⟦
			pushdef(⟦PREF⟧, defn(⟦FILE_PREFIX⟧))
			pushdef(⟦EXTERN⟧)
		⟧,
		⟦$#⟧, ⟦3⟧, ⟦
			pushdef(⟦PREF⟧, ⟦$3⟧.LANG_CODE)
			pushdef(⟦EXTERN⟧, ../defn(⟦RELAT_PATH⟧)defn(defn(⟦PREF⟧).anch)/defn(⟦OUTPUT_FILE⟧))
		⟧,
		⟦$#⟧, ⟦4⟧, ⟦
			pushdef(⟦PREF⟧, ⟦$3.$4⟧)
			pushdef(⟦EXTERN⟧, ../defn(⟦RELAT_PATH⟧)defn(defn(⟦PREF⟧).anch)/defn(⟦OUTPUT_FILE⟧))
		⟧, ⟦

		ROOT_ERROR(⟦$0($@) is not defined⟧)
	⟧)

	# find link in refs
	pushdef(⟦ANCH⟧, ifdef(__file__.mono.⟦$2⟧, ⟦defn(__file__.mono.⟦$2⟧)⟧, ⟦defn(defn(⟦PREF⟧).anch.⟦$2⟧)⟧))

	ifelse(defn(⟦ANCH⟧), ⟦⟧, ⟦

		ROOT_WARNING(⟦$0(⟦$1⟧, ⟦‘$2’ not found⟧, ⟦$3⟧, ⟦$4⟧); run ‘make -B refs …’ to regenerate reference list⟧)
	⟧)

	# find caption for title
	pushdef(⟦TITLE⟧, defn(defn(⟦PREF⟧).capt.⟦$2⟧))

	ifelse(defn(⟦TITLE⟧), ⟦⟧, ⟦⟧, ⟦

		# temporarily redefine macros (disable the original meaning)
		pushdef(⟦BOLD⟧, defn(⟦FST⟧))
		pushdef(⟦CODE⟧, defn(⟦SARG1⟧))
		pushdef(⟦NB⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦ ⟧)⟧)
		pushdef(⟦XCODE⟧, defn(⟦SARG1⟧))

		# expand title
		define(⟦TITLE⟧, ⟦ ⟧title="TITLE")

		# forget previous temporary macros
		popdef(

			⟦BOLD⟧,
			⟦CODE⟧,
			⟦NB⟧,
			⟦XCODE⟧,

		)
	⟧)

	# find caption in refs
	pushdef(⟦CAPT⟧, defn(defn(⟦PREF⟧).capt.⟦$1⟧))

	ifelse(defn(⟦CAPT⟧), ⟦⟧, ⟦

			# CAPT in refs not found, use the first LINK argument
			define(⟦CAPT⟧, ⟦$1⟧)
		⟧,
		⟦$1⟧, ⟦$2⟧, ⟦⟧, ⟦

			# CAPT in refs found, but the arg1 and arg2 are different, therefore use the arg1
			define(⟦CAPT⟧, ⟦$1⟧)
	⟧)

	# write the resulting _HTML_ code and forget local defined macros
	divert(CURRQU)dnl
<a href="defn(⟦EXTERN⟧)⟦#⟧defn(⟦ANCH⟧)"defn(⟦TITLE⟧)>CAPT</a>popdef(⟦CURRQU⟧, ⟦EXTERN⟧, ⟦PREF⟧, ⟦ANCH⟧, ⟦TITLE⟧, ⟦CAPT⟧)dnl
⟧)

#      ___________      __________
# --->/ REF_FIRST \--->/ REF_NEXT \---.
#     \___________/    \__________/<--'
#
# A → β
define(⟦REF_FIRST⟧, ⟦pushdef(⟦CURRQU⟧, divnum)divert(-1)

	# set reference index, create symbol and an unique tuple
	define(⟦REF_COUNTER⟧, ⟦1⟧)
	define(⟦REF_IDENTIFIER⟧, defn(⟦NSP⟧, ⟦REF_ANCH⟧, ⟦REF_COUNTER⟧))
	define(⟦{$1|$2|$3}⟧, REF_COUNTER)

	# transition to the next node
	define(⟦$0⟧, defn(⟦REF_NEXT⟧))

	# create new entry for all references under the article
	divert(ARTICLE_REFERENCES)dnl
<ol class="ADD_CLASS(⟦refs⟧)">
<li>ifelse(defn(⟦CURRQU⟧), ⟦-1⟧, ⟦⟧, ⟦<a href="⟦#⟧REF_IDENTIFIER" title="WORD_SOURCE"></a>⟧)<b>$1</b>ifelse(⟦$2⟧, ⟦⟧, ⟦⟧, ⟦, $2⟧),
<a href="⟦$3⟧">⟦$3⟧</a></li>
divert(END_OF_REFERENCES)dnl
</ol>
divert(CURRQU)popdef(⟦CURRQU⟧)dnl
<a href="⟦$3⟧" title="$1" id="REF_IDENTIFIER">[REF_COUNTER]</a>dnl
⟧)

# β
define(⟦REF_NEXT⟧, ⟦pushdef(⟦CURRQU⟧, divnum)divert(-1)

	# test if the reference already exists
	ifdef(⟦{$1|$2|$3}⟧, ⟦

		divert(CURRQU)popdef(⟦CURRQU⟧)dnl
<a href="⟦$3⟧" title="$1">PAYR(REF_COUNTER)</a>dnl
⟧, ⟦
		# increment the reference counter
		define(⟦REF_VALUE⟧, define(⟦REF_COUNTER⟧, incr(REF_COUNTER))REF_COUNTER)
		define(⟦REF_IDENTIFIER⟧, defn(⟦NSP⟧, ⟦REF_ANCH⟧, ⟦REF_VALUE⟧))
		define(⟦{$1|$2|$3}⟧, REF_VALUE)

		divert(ARTICLE_REFERENCES)dnl
<li>ifelse(defn(⟦CURRQU⟧), ⟦-1⟧, ⟦⟧, ⟦<a href="⟦#⟧REF_IDENTIFIER" title="WORD_SOURCE"></a>⟧)<b>$1</b>ifelse(⟦$2⟧, ⟦⟧, ⟦⟧, ⟦, $2⟧),
<a href="⟦$3⟧">⟦$3⟧</a></li>
divert(CURRQU)popdef(⟦CURRQU⟧)dnl
<a href="⟦$3⟧" title="$1" id="REF_IDENTIFIER">[REF_VALUE]</a>dnl
⟧)dnl
⟧)

# forget local β rules (good for frozen files)
popdef(

	⟦ANYTHING_6⟧,
	⟦BETA1⟧,
	⟦BETA2⟧,
	⟦BETA3⟧,
	⟦BETA4⟧,
	⟦CLASS_3⟧,
	⟦CLASS_3_EXPLAIN⟧,
	⟦HTML_GLOBAL_ATTRIBUTES⟧,
	⟦ID_5⟧,
	⟦MAKE_INLINE_ELEMENT⟧,
	⟦MAKE_INLINE_ELEMENT_EXPAND⟧,
	⟦MAKE_INLINE_ELEMENT_SPECIAL⟧,
	⟦STYLE_4⟧,
	⟦SUPER_BETA⟧,
	⟦TITLE_2⟧,
	⟦VAR_ANYTHING_6⟧,
	⟦VAR_ANYTHING_7⟧,
	⟦VAR_CLASS_3⟧,
	⟦VAR_CLASS_3_HGL⟧,
	⟦VAR_ID_5⟧,
	⟦VAR_REL_6⟧,
	⟦VAR_STYLE_4⟧,
	⟦VAR_TITLE_2⟧,
	⟦XTITLE_2⟧,

)
