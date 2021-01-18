__AUTHOR(⟦Josef Kubin⟧, ⟦2019,12,31⟧)
___DESCR(⟦sets heading item in desired language⟧)
__REASON(⟦{mono,multi}lingual headings⟧)

# if more args are provided, the first argument is #ID
# β
pushdef(⟦SET_ID⟧, ⟦

	ifelse(⟦$#⟧, ⟦1⟧, ⟦
		undefine(⟦#ID⟧)
	⟧, ⟦
		define(⟦#ID⟧, ⟦$1⟧)
	⟧)
⟧)

# β
define(⟦MONOLINGUAL_HEADINGS⟧, defn(⟦SET_ID⟧)⟦

	define(⟦SELITM⟧, SELECT_ARG1_CROP_WHITE_CHARS(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦))
⟧)

# captions, chapters, appendices; there is no need to strip trailing LF
# β
define(⟦MULTILINGUAL_HEADINGS⟧, defn(⟦SET_ID⟧)⟦

	define(⟦SELITM⟧, SELECT_LANG_CROP_WHITE_CHARS(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦))
⟧)

# forget local β rules (good for frozen files)
popdef(

	⟦SET_ID⟧,

)
