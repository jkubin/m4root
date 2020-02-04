# vim:ts=48:sw=48

__HEADER([Josef Kubin], [2019/12/28], [root_cz])
___DESCR([basic set of inline elements with a subset of global attributes])
___POINT([HTML5 inline elements])

# WARNING: keep all HTML tags with spell.m4 file 1:1

# global attributes for most tags
# β
pushdef([TITLE_2],	[[]ifelse([$2], [], [], [ title="[$2]"])])
pushdef([XTITLE_2],	[[]ifelse([$2], [], [], [ title="$2"])])
pushdef([CLASS_3],	[ifelse([$3], [], [], [ class="ADD_CLASS([$3])"])])
pushdef([STYLE_4],	[ifelse([$4], [], [], [ style="[$4]"])])
pushdef([ID_5],	[ifelse([$5], [], [], [ id="FIND_AND_ADD_ID_RULE_SET([$5])"])])
pushdef([ANYTHING_6],	[ifelse([$6], [], [], [ [$6]])])

# global attributes group
# β
pushdef([HTML_GLOBAL_ATTRIBUTES],	defn([TITLE_2], [CLASS_3], [STYLE_4], [ID_5], [ANYTHING_6]))

# custom macros for convenience

# A → β
define([AHTR],	[AH([$1], ifelse([$#], [2], [], [[$2]]),,,, ifelse([$#], [3], [], [[$3]]), ]defn([SELECT_LAST])[)])
define([BR],	[ifelse([$#], [0], [[$0]], [<br>])])
define([BUN],	[BO([$1], [$2], [un])])
define([CODE_BLUE],	[CODE([$1], [$2], [bl])])
define([CODE_M4U],	[CODE_M4([$1], [$2], [un])])
define([CODE_UND],	[CODE([$1], [$2], [un])])
define([QUOTE],	[ifelse([$#], [0], [[$0]], [„$1“])])
define([WBR],	[ifelse([$#], [0], [[$0]], [<wbr>])])

# built-in styles for root.cz
# A → β
define([GRAY],	[ifelse([$#], [0], [[$0]], ]BRAC([<span class="rs-note"]defn([TITLE_2])[>$1</span>])[)])
define([PERSON],	[ifelse([$#], [0], [[$0]], ]BRAC([<span class="rs-person"]defn([TITLE_2])[>$1</span>])[)])

# how to use AH(…)
#
# AH	---> AH
# AH (…)	---> AH (…)
# AH([URL])	---> <a href="URL">URL</a>
# AH([text], [URL])	---> <a href="URL">text</a>
# AH([text], [my_title], [URL])	---> <a href="URL" title="my_title">text</a>
# AH([text], [my_title],,,, [my_rel], [URL])	---> <a href="URL" title="my_title" rel="my_rel">text</a>
# AH([text], [my_title], [my_class], [URL])	---> <a href="URL" title="my_title" class="my_class">text</a>
# AH([text], [], [my_class], [URL])	---> <a href="URL" class="my_class">text</a>
# AH([text],,,,, [my_rel], [URL])	---> <a href="URL" rel="my_rel">text</a>
# AH([text],,,,,, [foo="bar" baz="ham"], [URL])	---> <a href="URL" foo="bar" baz="ham">text</a>
# AH([text], [my_title], [my_class], [my_style], [URL])	---> <a href="URL" title="my_title" class="my_class" style="my_style">text</a>
# AH([text], [my_title], [my_class],, [my_id], [URL])	---> <a href="URL" title="my_title" class="my_class" id="my_id">text</a>
# AH([text], [my_title], [my_class],,, [my_rel], [URL])	---> <a href="URL" title="my_title" class="my_class" rel="my_rel">text</a>
# β
pushdef([AH_TITLE_2],	[ifelse([$#], [2], [], [$2], [], [], [ title="[$2]"])])
pushdef([AH_CLASS_3],	[ifelse([$#], [3], [], [$3], [], [], [ class="ADD_CLASS([$3])"])])
pushdef([AH_STYLE_4],	[ifelse([$#], [4], [], [$4], [], [], [ style="[$4]"])])
pushdef([AH_ID_5],	[ifelse([$#], [5], [], [$5], [], [], [ id="FIND_AND_ADD_ID_RULE_SET([$5])"])])
pushdef([AH_REL_6],	[ifelse([$#], [6], [], [$6], [], [], [ rel="[$6]"])])
pushdef([AH_ANYTHING_7],	[ifelse([$#], [7], [], [$7], [], [], [ [$7]])])

# how to use AHTR(…), an example how to reduce the amount of commas
#
# AHTR([URL])	---> <a href="URL">URL</a>
# AHTR([text], [URL])	---> <a href="URL">text</a>
# AHTR([text], [my_title], [URL])	---> <a href="URL" title="my_title">text</a>
# AHTR([text], [my_title], [my_rel], [URL])	---> <a href="URL" title="my_title" rel="my_rel">text</a>
# AHTR([text],, [my_rel], [URL])	---> <a href="URL" rel="my_rel">text</a>

# A → β
pushdef([CREATE_INLINE_ELEMENT],	[define([$1], [ifelse($][#, 0, ]BRAC(BRAC($[0]))[, ]BRAC([<$2]defn([HTML_GLOBAL_ATTRIBUTES])[>$][1</$2>])[)])])
pushdef([CREATE_INLINE_ELEMENT_EXPAND],	[define([$1], [ifelse($][#, 0, ]BRAC(BRAC($[0]))[, ]BRAC([<$2]defn([XTITLE_2], [CLASS_3], [STYLE_4], [ID_5], [ANYTHING_6])[>$][1</$2>])[)])])
pushdef([CREATE_INLINE_ELEMENT_SPECIAL],	[define([$1], [ifelse($][#, 0, ]BRAC(BRAC($[0]))[, ]BRAC([$2])[)])])

CREATE_INLINE_ELEMENT([ABBR],	[abbr])
CREATE_INLINE_ELEMENT([ACRO],	[acronym])
CREATE_INLINE_ELEMENT([BO],	[strong])
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
CREATE_INLINE_ELEMENT([SUB],	[sub])
CREATE_INLINE_ELEMENT([SUP],	[sup])
CREATE_INLINE_ELEMENT([TIME],	[time])
CREATE_INLINE_ELEMENT([UL],	[ul])
CREATE_INLINE_ELEMENT([VAR],	[var])
CREATE_INLINE_ELEMENT_EXPAND([XSPAN],	[span])
CREATE_INLINE_ELEMENT_SPECIAL([AH],	[<a href="]defn([SELECT_LAST])"defn([AH_TITLE_2], [AH_CLASS_3], [AH_STYLE_4], [AH_ID_5], [AH_REL_6], [AH_ANYTHING_7])[>$1</a>])
CREATE_INLINE_ELEMENT_SPECIAL([CODE_M4],	[<code]defn([HTML_GLOBAL_ATTRIBUTES])[>[$1]</code>])

# forget local β rules (good for frozen files)
popdef(

	[AH_ANYTHING_7],
	[AH_CLASS_3],
	[AH_ID_5],
	[AH_REL_6],
	[AH_STYLE_4],
	[AH_TITLE_2],
	[ANYTHING_6],
	[CLASS_3],
	[CREATE_INLINE_ELEMENT],
	[CREATE_INLINE_ELEMENT_SPECIAL],
	[HTML_GLOBAL_ATTRIBUTES],
	[ID_5],
	[STYLE_4],
	[TITLE_2],
	[XTITLE_2],

)
