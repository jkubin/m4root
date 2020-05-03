__HEADER([Josef Kubin], [2020/03/08], [html])
___DESCR([here the processed parts of JavaScript-s are composed into the final script])
___POINT([code decomposition to simplify difficult things])

#      _____________________      __________
# --->/ ADD_JAVASCRIPT_TAGS \--->/ undefine \
#     \_____________________/    \__________/
#
# A → β
define([ADD_JAVASCRIPT_TAGS], [

	undefine([ADD_JAVASCRIPT_TAGS])

	divert(JAVASCRIPT_DISABLED)dnl
<noscript><div title="defn([WORD_INFORMATION])" class="rs-tip-major ADD_CLASS([info])">LANG(dnl
[Srozumitelnost ukázek zdrojového kódu zvyšuje povolený JavaScript],
[Enabling JavaScript enhances the clarity of the source code samples]).</div></noscript>
divert(JAVASCRIPT_CODE)dnl
<script>dnl
divert(JAVASCRIPT_CODE_END)dnl
</script>
divert(-1)
])

#      ________________________________      __________
# --->/ ADD_JAVASCRIPT_FOR_SOURCE_CODE \--->/ undefine \
#     \________________________________/    \__________/
#
# A → β
define([ADD_JAVASCRIPT_FOR_SOURCE_CODE], [

	undefine([ADD_JAVASCRIPT_FOR_SOURCE_CODE])

	ADD_JAVASCRIPT_TAGS()

	# the only global JavaScript symbol must not conflict with other symbol in the parent HTML page
	divert(JAVASCRIPT_CODE)dnl
var m4root={undivert([html/init.js])};dnl
m4root.init(dnl
document.getElementsByClassName("defn([NSP], [CLASS_HGL])"),dnl
document.getElementsByClassName("defn([NSP], [CLASS_SRC])"),dnl
"defn([NSP], [CLASS_REAR])",dnl
"defn([DEFAULT_HIGHLIGHT_COLOR])")dnl
divert(-1)
])
