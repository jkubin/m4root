__HEADER([Josef Kubin], [2019/12/28], [root_cz])
___DESCR([basic set of inline elements with a subset of global attributes])
___POINT([HTML5 inline elements])

# WARNING: keep all HTML tags with spell.m4 file 1:1

# html global attributes for most tags
# β
pushdef([TITLE_2],	[[]ifelse([$2], [], [], [ title="[$2]"])])
pushdef([CLASS_3],	[ifelse([$3], [], [], [ class="ADD_CLASS_RULE_SET([$3])"])])
pushdef([STYLE_4],	[ifelse([$4], [], [], [ style="[$4]"])])
pushdef([ID_5],		[ifelse([$5], [], [], [ id="FIND_AND_ADD_ID_RULE_SET([$5])"])])
pushdef([ANYTHING_6],	[ifelse([$6], [], [], [ [$6]])])

# custom macros for convenience
# A → β

# define([TIP_BOX_NOTE],	[ifelse([$#], [0], [[$0]], [SPAN([WORD_NOTE:],, [note])])])
define([BR],		[ifelse([$#], [0], [[$0]], [<br>])])
define([BUN],		[BO([$1],, [un])])
define([CODE_BLUE],	[CODE([$1],, [bl])])
define([CODE_M4U],	[CODE_M4([$1],, [un])])
define([CODE_UND],	[CODE([$1],, [un])])
define([QUOTE],		[ifelse([$#], [0], [[$0]], [„$1“])])
define([WBR],		[ifelse([$#], [0], [[$0]], [<wbr>])])

# built-in styles for root.cz
# A → β
define([NOTE],		[ifelse([$#], [0], [[$0]], ]BRAC([<span class="rs-note"]defn([TITLE_2])[>$1</span>])[)])
define([PERSON],	[ifelse([$#], [0], [[$0]], ]BRAC([<span class="rs-person"]defn([TITLE_2])[>$1</span>])[)])

# How to use <a href=""></a> html tag:
# AH	---> AH
# AH (…)	---> AH (…)
# AH([URL])	---> <a href="URL">URL</a>
# AH([text], [URL])	---> <a href="URL">text</a>
# AH([text], [title], [URL])		---> <a href="URL" title="title">text</a>
# AH([text], [title], [class], [URL])	---> <a href="URL" title="title" class="class">text</a>
# AH([text], [], [class], [URL])		---> <a href="URL" class="class">text</a>
# AH([text], [title], [class], [style], [URL])	---> …
# AH([text], [title], [class], [style], [id], [URL])
# AH([text], [title], [class], [style], [id], [rel], [URL])
# AH([text], [title], [class], [style], [id], [rel], [anything], [URL])
# AH([text],,,,, [rel], [URL])	---> <a href="URL" rel="rel">text</a>
# AH([text],,,,,, [foo="bar" baz="ham"], [URL])	---> <a href="URL" foo="bar" baz="ham">text</a>
# β
pushdef([AH_TITLE_2],		[ifelse([$#], [2], [], [$2], [], [], [ title="[$2]"])])
pushdef([AH_CLASS_3],		[ifelse([$#], [3], [], [$3], [], [], [ class="ADD_CLASS_RULE_SET([$3])"])])
pushdef([AH_STYLE_4],		[ifelse([$#], [4], [], [$4], [], [], [ style="[$4]"])])
pushdef([AH_ID_5],		[ifelse([$#], [5], [], [$5], [], [], [ id="FIND_AND_ADD_ID_RULE_SET([$5])"])])
pushdef([AH_REL_6],		[ifelse([$#], [6], [], [$6], [], [], [ rel="[$6]"])])
pushdef([AH_ANYTHING_7],	[ifelse([$#], [7], [], [$7], [], [], [ [$7]])])

# html tag attributes group
# β
pushdef([HTML_GLOBAL_ATTRIBUTES],	defn([TITLE_2], [CLASS_3], [STYLE_4], [ID_5], [ANYTHING_6]))
pushdef([HTML_INLINE_ELEMENT],		[<defn([#$0])]defn([HTML_GLOBAL_ATTRIBUTES])[>$1</defn([#$0])>])

# A → β
# β
define([SPAN], [ifelse([$#], [0], [[$0]], [indir([#$0>], $@)])])
define([#SPAN>], defn([HTML_INLINE_ELEMENT]))
define([##SPAN>], [span])

# scripts to sort tags
# :'<,'>! sed ':a;N;/\n$/\!ba;s/\n//g'
# :'<,'>! sort
# :'<,'>! sed 's/)define/)\ndefine/g; s/$/\n/'

define([ABBR], defn([SPAN]))
define([#ABBR>], defn([HTML_INLINE_ELEMENT]))
define([##ABBR>], [abbr])
 
define([ACRO], defn([SPAN]))
define([#ACRO>], defn([HTML_INLINE_ELEMENT]))
define([##ACRO>], [acronym])
 
define([AH], defn([SPAN]))
define([#AH>], [<a href="]defn([SELECT_LAST])["]defn([AH_TITLE_2], [AH_CLASS_3], [AH_STYLE_4], [AH_ID_5], [AH_REL_6], [AH_ANYTHING_7])[>$1</a>])

define([BUTTON], defn([SPAN]))
define([#BUTTON>], defn([HTML_INLINE_ELEMENT]))
define([##BUTTON>], [button])

define([BO], defn([SPAN]))
define([#BO>], defn([HTML_INLINE_ELEMENT]))
define([##BO>], [strong])

define([CITE], defn([SPAN]))
define([#CITE>], defn([HTML_INLINE_ELEMENT]))
define([##CITE>], [cite])

define([CODE], defn([SPAN]))
define([#CODE>], defn([HTML_INLINE_ELEMENT]))
define([##CODE>], [code])

define([CODE_M4], defn([SPAN]))
define([#CODE_M4>], [<code]defn([HTML_GLOBAL_ATTRIBUTES])[>[$1]</code>])

define([DEL], defn([SPAN]))
define([#DEL>], defn([HTML_INLINE_ELEMENT]))
define([##DEL>], [del])

define([DFN], defn([SPAN]))
define([#DFN>], defn([HTML_INLINE_ELEMENT]))
define([##DFN>], [dfn])

define([EM], defn([SPAN]))
define([#EM>], defn([HTML_INLINE_ELEMENT]))
define([##EM>], [em])

define([INS], defn([SPAN]))
define([#INS>], defn([HTML_INLINE_ELEMENT]))
define([##INS>], [ins])

define([LABEL], defn([SPAN]))
define([#LABEL>], defn([HTML_INLINE_ELEMENT]))
define([##LABEL>], [label])

define([LI], defn([SPAN]))
define([#LI>], defn([HTML_INLINE_ELEMENT]))
define([##LI>], [li])

define([MARK], defn([SPAN]))
define([#MARK>], defn([HTML_INLINE_ELEMENT]))
define([##MARK>], [mark])

define([METER], defn([SPAN]))
define([#METER>], defn([HTML_INLINE_ELEMENT]))
define([##METER>], [meter])

define([OL], defn([SPAN]))
define([#OL>], defn([HTML_INLINE_ELEMENT]))
define([##OL>], [ol])

define([PROGRESS], defn([SPAN]))
define([#PROGRESS>], defn([HTML_INLINE_ELEMENT]))
define([##PROGRESS>], [progress])

define([QM], defn([SPAN]))
define([#QM>], defn([HTML_INLINE_ELEMENT]))
define([##QM>], [q])

define([SAMP], defn([SPAN]))
define([#SAMP>], defn([HTML_INLINE_ELEMENT]))
define([##SAMP>], [samp])

define([SMALL], defn([SPAN]))
define([#SMALL>], defn([HTML_INLINE_ELEMENT]))
define([##SMALL>], [small])

define([SUB], defn([SPAN]))
define([#SUB>], defn([HTML_INLINE_ELEMENT]))
define([##SUB>], [sub])

define([SUP], defn([SPAN]))
define([#SUP>], defn([HTML_INLINE_ELEMENT]))
define([##SUP>], [sup])

define([TIME], defn([SPAN]))
define([#TIME>], defn([HTML_INLINE_ELEMENT]))
define([##TIME>], [time])

define([UL], defn([SPAN]))
define([#UL>], defn([HTML_INLINE_ELEMENT]))
define([##UL>], [ul])

define([VAR], defn([SPAN]))
define([#VAR>], defn([HTML_INLINE_ELEMENT]))
define([##VAR>], [var])


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
	[HTML_GLOBAL_ATTRIBUTES],
	[HTML_INLINE_ELEMENT],
	[ID_5],
	[STYLE_4],
	[TITLE_2],

)
