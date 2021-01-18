__AUTHOR(⟦Josef Kubin⟧, ⟦2020,03,08⟧)
___DESCR(⟦here the processed parts of JavaScript-s are composed into the final script⟧)
__REASON(⟦code decomposition to simplify difficult things⟧)

#      _____________________      __________
# --->/ ADD_JAVASCRIPT_TAGS \--->/ undefine \
#     \_____________________/    \__________/
#
# A → β
define(⟦ADD_JAVASCRIPT_TAGS⟧, ⟦

	undefine(⟦ADD_JAVASCRIPT_TAGS⟧)

	divert(JAVASCRIPT_DISABLED)dnl
<noscript><div title="defn(⟦WORD_INFORMATION⟧)" class="rs-tip-major ADD_CLASS(⟦info⟧)">defn(⟦NOSCRIPT_MESSAGE⟧)</div></noscript>
divert(JAVASCRIPT_CODE)dnl
<script>dnl
divert(JAVASCRIPT_CODE_END)dnl
</script>
divert(-1)
⟧)

#      ________________________________      __________
# --->/ ADD_JAVASCRIPT_FOR_SOURCE_CODE \--->/ undefine \
#     \________________________________/    \__________/
#
# A → β
define(⟦ADD_JAVASCRIPT_FOR_SOURCE_CODE⟧, ⟦

	undefine(⟦ADD_JAVASCRIPT_FOR_SOURCE_CODE⟧)

	ADD_JAVASCRIPT_TAGS()

	# the only global JavaScript symbol must not conflict with other symbol in the parent HTML page
	divert(JAVASCRIPT_CODE)dnl
var m4root={undivert(
	⟦js/hgl_packed.js⟧,
	⟦js/info_packed.js⟧,
	⟦js/select_packed.js⟧,
)}dnl
divert(JAVASCRIPT_CODE_INIT)dnl
<script>dnl
m4root.init(dnl
document.getElementsByClassName("defn(⟦CLASS_HIGHLIGHT⟧)"),dnl
document.getElementsByClassName("defn(⟦CLASS_SOURCE⟧)"),dnl
document.getElementsByClassName("defn(⟦CLASS_COMMAND_LINE⟧)"),dnl
"defn(⟦NSP⟧)",dnl							NameSPace prefix
"defn(⟦CLASS_REAR⟧)",dnl						class container for stripes
"defn(⟦CLASS_STRIPE⟧)",dnl						class name for colored stripe
"defn(⟦DEFAULT_HIGHLIGHT_CLASS⟧)")dnl					class to highlight stripes and source code
</script>
divert(-1)
⟧)
