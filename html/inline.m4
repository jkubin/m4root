# vim:ts=20:sw=20

__HEADER([Josef Kubin], [2019/12/28], [root_cz])
___DESCR([inline elements with a subset of global attributes])
___POINT([HTML5 inline elements])

# WARNING: keep all HTML tags 1:1 with spell.m4

# global attributes for most tags
# β
pushdef([TITLE_2],		[[]ifelse([$2], [], [], [ title="[$2]"])])
pushdef([XTITLE_2],		[[]ifelse([$2], [], [], [ title="$2"])])
pushdef([CLASS_3],		[ifelse([$3], [], [], [ class="ADD_CLASS([$3])"])])
pushdef([CLASS_3_EXPL],	[ class="ADD_CLASS([xp])[]ifelse([$3], [], [], [ ADD_CLASS([$3])])"])
pushdef([STYLE_4],		[ifelse([$4], [], [], [ style="[$4]"])])
pushdef([ID_5],		[ifelse([$5], [], [], [ id="ADD_ID_ANCH([$5])"])])
pushdef([ANYTHING_6],	[ifelse([$6], [], [], [ [$6]])])

# global attributes group
# β
pushdef([HTML_GLOBAL_ATTRIBUTES],	defn([TITLE_2], [CLASS_3], [STYLE_4], [ID_5], [ANYTHING_6]))

# custom macros for convenience

# A → β
define([BR],	[ifelse([$#], [0], [[$0]], [<br>])])
define([BUN],	[BO([$1], [$2], [un])])
define([CODE_BLUE],	[CODE([$1], [$2], [bl])])
define([CODE_M4U],	[CODE_M4([$1], [$2], [un])])
define([CODE_UND],	[CODE([$1], [$2], [un])])
define([EXPL],	[SPAN([$1], [$2], [xp])])
define([EXPL_M4],	[CODE_M4([$1], [$2], [xp])])
define([MM],	[ifelse([$#], [0], [[$0]], [<span class=NSP()$2>$1</span>])])	<--- mnemonic: Marking Macro
define([QUOTE],	[ifelse([$#], [0], [[$0]], [„$1“])])
define([WBR],	[ifelse([$#], [0], [[$0]], [<wbr>])])

# built-in styles for root.cz
# A → β
define([GRAY],	[ifelse([$#], [0], [[$0]], ]BRAC([<span class="rs-note"]defn([TITLE_2])[>$1</span>])[)])
define([PERSON],	[ifelse([$#], [0], [[$0]], ]BRAC([<span class="rs-person"]defn([TITLE_2])[>$1</span>])[)])

# how to use ULINK(…)
#
# ULINK	---> ULINK
# ULINK (…)	---> ULINK (…)
# ULINK([URL])	---> <a href="URL">URL</a>
# ULINK([text], [URL])	---> <a href="URL">text</a>
# ULINK([text], [my_title], [URL])	---> <a href="URL" title="my_title">text</a>
# ULINK([text], [my_title],,,, [my_rel], [URL])	---> <a href="URL" title="my_title" rel="my_rel">text</a>
# ULINK([text], [my_title], [my_class], [URL])	---> <a href="URL" title="my_title" class="my_class">text</a>
# ULINK([text], [], [my_class], [URL])	---> <a href="URL" class="my_class">text</a>
# ULINK([text],,,,, [my_rel], [URL])	---> <a href="URL" rel="my_rel">text</a>
# ULINK([text],,,,,, [foo="bar" baz="ham"], [URL])	---> <a href="URL" foo="bar" baz="ham">text</a>
# ULINK([text], [my_title], [my_class], [my_style], [URL])	---> <a href="URL" title="my_title" class="my_class" style="my_style">text</a>
# ULINK([text], [my_title], [my_class],, [my_id], [URL])	---> <a href="URL" title="my_title" class="my_class" id="my_id">text</a>
# ULINK([text], [my_title], [my_class],,, [my_rel], [URL])	---> <a href="URL" title="my_title" class="my_class" rel="my_rel">text</a>
# β
pushdef([VAR_TITLE_2],	[ifelse([$#], [2], [], [$2], [], [], [ title="[$2]"])])
pushdef([VAR_CLASS_3],	[ifelse([$#], [3], [], [$3], [], [], [ class="ADD_CLASS([$3])"])])
pushdef([VAR_CLASS_3_HGL],	[ class="ADD_CLASS([hgl])[]ifelse([$#], [3], [], [$3], [], [], [ ADD_CLASS([$3])])"])
pushdef([VAR_STYLE_4],	[ifelse([$#], [4], [], [$4], [], [], [ style="[$4]"])])
pushdef([VAR_ID_5],		[ifelse([$#], [5], [], [$5], [], [], [ id="ADD_ID_ANCH([$5])"])])
pushdef([VAR_REL_6],	[ifelse([$#], [6], [], [$6], [], [], [ rel="[$6]"])])
pushdef([VAR_ANYTHING_6],	[ifelse([$#], [6], [], [$6], [], [], [ [$6]])])
pushdef([VAR_ANYTHING_7],	[ifelse([$#], [7], [], [$7], [], [], [ [$7]])])

# this is only an example, how to solve the problem of excessive commas (how to avoid coma :-)
#define([ULINKT],	[ULINK([$1], ifelse([$#], [2], [], [[$2]]),,,, ifelse([$#], [3], [], [[$3]]), ]defn([SELECT_LAST])[)])
# how to use ULINKT(…), an example how to reduce the amount of commas
#
# ULINKT([URL])	---> <a href="URL">URL</a>
# ULINKT([text], [URL])	---> <a href="URL">text</a>
# ULINKT([text], [my_title], [URL])	---> <a href="URL" title="my_title">text</a>
# ULINKT([text], [my_title], [my_rel], [URL])	---> <a href="URL" title="my_title" rel="my_rel">text</a>
# ULINKT([text],, [my_rel], [URL])	---> <a href="URL" rel="my_rel">text</a>

# β
pushdef([CREATE_INLINE_ELEMENT],		[define([$1], [ifelse($][#, 0, ]BRAC(BRAC($[0]))[, ]BRAC([<$2]defn([HTML_GLOBAL_ATTRIBUTES])[>$][1</$2>])[)])])
pushdef([CREATE_INLINE_ELEMENT_EXPAND],		[define([$1], [ifelse($][#, 0, ]BRAC(BRAC($[0]))[, ]BRAC([<$2]defn([XTITLE_2], [CLASS_3], [STYLE_4], [ID_5], [ANYTHING_6])[>$][1</$2>])[)])])
pushdef([CREATE_INLINE_ELEMENT_SPECIAL],	[define([$1], [ifelse($][#, 0, ]BRAC(BRAC($[0]))[, ]BRAC([$2])[)])])

CREATE_INLINE_ELEMENT([ABBR],	[abbr])
CREATE_INLINE_ELEMENT([ACRO],	[acronym])
CREATE_INLINE_ELEMENT([BO],	[strong])
CREATE_INLINE_ELEMENT([BOLD],	[b])
CREATE_INLINE_ELEMENT([BUTTON],	[button])
CREATE_INLINE_ELEMENT([CITE],	[cite])
CREATE_INLINE_ELEMENT([CODE],	[code])
CREATE_INLINE_ELEMENT([DEL],	[del])
CREATE_INLINE_ELEMENT([DFN],	[dfn])
CREATE_INLINE_ELEMENT([EM],	[em])
CREATE_INLINE_ELEMENT([INS],	[ins])
CREATE_INLINE_ELEMENT([LABEL],	[label])
CREATE_INLINE_ELEMENT([LI],	[li])
CREATE_INLINE_ELEMENT([MARK],	[mark])
CREATE_INLINE_ELEMENT([METER],	[meter])
CREATE_INLINE_ELEMENT([OL],	[ol])
CREATE_INLINE_ELEMENT([PROGRESS],	[progress])
CREATE_INLINE_ELEMENT([QM],	[q])
CREATE_INLINE_ELEMENT([SAMP],	[samp])
CREATE_INLINE_ELEMENT([SMALL],	[small])
CREATE_INLINE_ELEMENT([SPAN],	[span])
CREATE_INLINE_ELEMENT([STT],	[s])
CREATE_INLINE_ELEMENT([SUB],	[sub])
CREATE_INLINE_ELEMENT([SUP],	[sup])
CREATE_INLINE_ELEMENT([TIME],	[time])
CREATE_INLINE_ELEMENT([UL],	[ul])
CREATE_INLINE_ELEMENT([UN],	[u])
CREATE_INLINE_ELEMENT([VAR],	[var])
CREATE_INLINE_ELEMENT_EXPAND([XSPAN],	[span])
CREATE_INLINE_ELEMENT_SPECIAL([ULINK],	[<a href="]defn([SELECT_LAST])"defn([VAR_TITLE_2], [VAR_CLASS_3], [VAR_STYLE_4], [VAR_ID_5], [VAR_REL_6], [VAR_ANYTHING_7])[>$1</a>])
CREATE_INLINE_ELEMENT_SPECIAL([CODE_M4],	[<code]defn([HTML_GLOBAL_ATTRIBUTES])[>[$1]</code>])

# keyword to highlight line(s) in source code
# how to use:
# HCODE([keyword], [[[1, 2, 3], [reference_to_preformatted_code]]])
# HCODE([keyword], [my title], [[[1, 2, 3], [reference_to_preformatted_code]]])
# HCODE([keyword], [my title], [my_class], [[[1, 2, 3], [reference_to_preformatted_code]]])
# ...
# HCODE([keyword], [[[1, 2, 3], [path/file.x]]])
# HCODE([keyword], [my title], [[[1, 2, 3], [path/file.x]]])
# HCODE([keyword], [my title], [my_class], [[[1, 2, 3], [path/file.x]]])
# ...

# β
pushdef([BETA1], [pushdef([CURRQU], divnum)divert(-1)

	ifelse(eval([$# < 2]), [1], [

		ROOT_ERROR([the $0(…) requires at least 2 arguments])
	])

	CREATE_DATASET(dnl
])

# β
pushdef([BETA2], [)

divert(CURRQU)dnl
<$0_TAG[]])

# β
pushdef([BETA3], [defn([DATA_SET])>$1</$0_TAG>popdef([CURRQU], [DATA_SET_KEY], [DATA_SET])])
pushdef([BETA4], [defn([DATA_SET])>[$1]</$0_TAG>popdef([CURRQU], [DATA_SET_KEY], [DATA_SET])])
pushdef([SUPER_BETA], defn([BETA1], [EXPAND_LAST], [BETA2], [VAR_TITLE_2], [VAR_CLASS_3_HGL], [VAR_STYLE_4], [VAR_ID_5], [VAR_ANYTHING_6]))

# A → β
define([HCODE], defn([SUPER_BETA], [BETA3]))
define([HCODE_M4], defn([SUPER_BETA], [BETA4]))
define([HEXPL], defn([SUPER_BETA], [BETA3]))
define([HEXPL_M4], defn([SUPER_BETA], [BETA4]))

# A → β
define([HCODE_M4_TAG], [code])
define([HCODE_TAG], [code])
define([HEXPL_M4_TAG], [span])
define([HEXPL_TAG], [span])

# A → β
define([REMOVE_SPACES],	[translit([[$1]], [ ])])
define([SELECT_ARG2],	[[$2]])

# A → β
define([CREATE_DATASET], [

	ifelse([$1], [], [], [

		# find the record in the hash database of references
		define([DATA_SET_KEY], defn(__file__.dset.SELECT_ARG2($1)))

		ifelse(defn([DATA_SET_KEY]), [], [

			ROOT_WARNING([the key ‘]__file__.dset.SELECT_ARG2($1)[’ not found, fix your reference or run ‘make -B refs …’ to regenerate reference list])
		])

		define([DATA_SET], defn([DATA_SET]) data-defn([DATA_SET_KEY])="REMOVE_SPACES(SELECT_ARG1($1))")

		$0(shift($@))
	])
])

# forget local β rules (good for frozen files)
popdef(

	[ANYTHING_6],
	[BETA1],
	[BETA2],
	[BETA3],
	[BETA4],
	[CLASS_3],
	[CLASS_3_EXPL],
	[CREATE_INLINE_ELEMENT],
	[CREATE_INLINE_ELEMENT_EXPAND],
	[CREATE_INLINE_ELEMENT_SPECIAL],
	[HTML_GLOBAL_ATTRIBUTES],
	[ID_5],
	[STYLE_4],
	[SUPER_BETA],
	[TITLE_2],
	[VAR_ANYTHING_6],
	[VAR_ANYTHING_7],
	[VAR_CLASS_3],
	[VAR_CLASS_3_HGL],
	[VAR_ID_5],
	[VAR_REL_6],
	[VAR_STYLE_4],
	[VAR_TITLE_2],
	[XTITLE_2],

)
