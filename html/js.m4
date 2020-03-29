# vim:ft=javascript:cc=81

__HEADER([Josef Kubin], [2020/03/08], [html])
___DESCR([various auxiliary JavaScripts for html code])
___POINT([DHTML prepared by M4])

# common code for test results
# β
pushdef([TEST_RESULT_OF_AN_EXTERNAL_COMMAND], [

	# stop if an error occurred
	ifelse(sysval, [0], [], [

		ROOT_ERROR([an external command error occured])
	])
])

#      _____________________      __________
# --->/ ADD_JAVASCRIPT_TAGS \--->/ undefine \
#     \_____________________/    \__________/
#
# A → β
define([ADD_JAVASCRIPT_TAGS], [

	undefine([ADD_JAVASCRIPT_TAGS])

	divert(JAVASCRIPT_DISABLED)dnl
<noscript><div title="defn([WORD_INFORMATION])" class="rs-tip-major ADD_CLASS([info])">LANG(dnl
[Srozumitelnost ukázkového zdrojového kódu zvyšuje povolený JavaScript],
[The clarity of the sample source code increases JavaScript enabled]).</div></noscript>
divert(JAVASCRIPT_CODE)dnl
<script>dnl
divert(JAVASCRIPT_CODE_END)dnl
</script>
divert(-1)
])

#      _________________________________      __________
# --->/ ADD_JAVASCRIPT_FOR_LINE_NUMBERS \--->/ undefine \
#     \_________________________________/    \__________/
#
# A → β
define([ADD_JAVASCRIPT_FOR_LINE_NUMBERS], [

	undefine([ADD_JAVASCRIPT_FOR_LINE_NUMBERS])

	ADD_JAVASCRIPT_TAGS()

	divert(JAVASCRIPT_CODE)ARG1(esyscmd([sed -f html/js_compress.sed << EOF

/*
 * a line to highlight in preformatted-source-code
 * <code data-ln="2" data-id="preformatted-source-code">keyword</ code>
 *
 * several lines to highlight in preformatted-source-code
 * <code data-ln="1,3,6,2" data-id="preformatted-source-code">keyword</ code>
 * 
 * this is a preformatted target source code with lines to highlight
 * <pre id="preformatted-source-code">…</ pre>
 *
 * Notes:
 * /!\ keep all global variables in dedicated namespace: m4_*
 * /!\ keep all variable names consistent with the file jscompress.js because
 * lengthy JavaScript is eventually compressed to a smaller one-line script
 */
var m4_keywords = document.getElementsByClassName("]NSP()[hg"),
		// NSP() is a global CSS namespace prefix
		m4_all_pre_tags = document.getElementsByTagName("pre"),
		m4_associative_array_of_keywords = [];

/*
 * the following code find keywords pointing to the preformatted-source-code
 * and add them to the array in associative array
 */
for (var keyword of m4_keywords) {

	var highlight_source_code_id = keyword.dataset.id;

	if (highlight_source_code_id) {

		if (!m4_associative_array_of_keywords[highlight_source_code_id])
			m4_associative_array_of_keywords[highlight_source_code_id] = [];

		m4_associative_array_of_keywords[highlight_source_code_id].push(keyword);
	}
}

/*
 * the following code links keywords with the appropriate lines of source code which highlight
 */
for (var highlighted_source_code of m4_all_pre_tags) {

	var all_highlighting_keywords,
		container_element = highlighted_source_code.parentElement,
		number_of_lines_of_code = highlighted_source_code.innerHTML.split('\n').length,
		ordered_list = document.createElement("ol");

	for (var i = 0; i < number_of_lines_of_code; i++)
		ordered_list.appendChild(document.createElement("li"));

	/*
	 * if id="…" is an attribute in the highlighted_source_code <pre></ pre>
	 * tag and it is referenced by a keyword or several keywords
	 */
	if (all_highlighting_keywords =
		m4_associative_array_of_keywords[highlighted_source_code.id]) {

		for (var keyword of all_highlighting_keywords) {

			var lines_to_highlight = keyword.dataset.ln.split(','),
				list_item = ordered_list.childNodes,
				lines_of_code_to_highlight = [];

			for (var line of lines_to_highlight)
				lines_of_code_to_highlight.push(list_item[line - 1]);

			/*
			 * attach mouse event handlers to the keyword in order to
			 * highlight appropriate list items in the parent ordered list
			 */
			keyword.onmouseover=(function(lines) {

				return function() {

					for (var line of lines)
						line.style.backgroundColor='red';
				}

			})(lines_of_code_to_highlight);

			keyword.onmouseout=(function(lines) {

				return function() {

					for (var line of lines)
						line.style=null;
					/*
					 * the line.style.backgroundColor='initial';
					 * is buggy in google-chrome
					 * (it does not set original background color)
					 */
				}

			})(lines_of_code_to_highlight);
		}
	}

	/*
	 * append the ordered list to the DOM tree into container_element
	 * as the first child just before the <pre>…</ pre> tag
	 * Z-index is not explicitly set because the elements are in natural Z order
	 */
	container_element.insertBefore(ordered_list, highlighted_source_code);
}

EOF]))divert(-1)
]defn([TEST_RESULT_OF_AN_EXTERNAL_COMMAND]))

# forget local β rules (good for frozen files)
popdef(

	[TEST_RESULT_OF_AN_EXTERNAL_COMMAND],

)
