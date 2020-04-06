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

	divert(JAVASCRIPT_CODE)ARG1(esyscmd([sed -f html/js_compress.sed << EOF
/*
 * tag to highlight a line in a preformatted_source_code.m4
 * <code class="m4-hgl" data-m4_preformatted_source_code.m4="2">keyword</ code>
 *
 * tag to highlight several lines in a preformatted-source-code.m4
 * <code class="m4-hgl" data-m4_preformatted_source_code.m4="1,3,6,2">keyword</ code>
 * 
 * this is a preformatted target source code with lines to highlight
 * <pre id="m4_preformatted_source_code">…</ pre>
 *
 * Notes:
 * /!\ keep all global variables in the dedicated namespace: m4_*
 * /!\ keep all variable names consistent with the file jscompress.js because
 * lengthy JavaScript is eventually compressed to a smaller one-line script
 *
 * NSP() is a global CSS namespace prefix defined in the configuration file
 */

let m4_keywords = document.getElementsByClassName("]NSP()[hgl"),
		m4_all_sources = document.getElementsByClassName("]NSP()[src"),
		m4_associative_array_of_keywords = [];

/*
 * the following code finds keywords pointing to the preformatted-source-code
 * and adds them to the array in an associative array
 */
for (let keyword of m4_keywords) {

	let source_node = Object.keys(keyword.dataset), item;

	for (let item of source_node) {

		if (!m4_associative_array_of_keywords[item])
			m4_associative_array_of_keywords[item] = [];

		m4_associative_array_of_keywords[item].push(keyword);
	}
}

/*
 * copy information from attributes to dedicated element
 * in order to easily copy&paste embedded data
 */
function m4_add_info() {

	var parent_node = this.parentNode, source_info;

	if (this.source_info) {

		if (this.source_info.isConnected)
			parent_node.removeChild(this.source_info);
		else
			parent_node.appendChild(this.source_info);

		return;
	}

	source_info = document.createElement("div");
	source_info.appendChild(document.createTextNode(this.title));
	source_info.appendChild(document.createElement("br"));
	source_info.appendChild(document.createTextNode(this.nextSibling.title.split('\n')[1]));
	this.source_info = source_info;

	parent_node.appendChild(source_info);
}

/*
 * the following code links keywords with the appropriate lines
 * of source code which highlights
 */
for (let source_node of m4_all_sources) {

	let all_highlighting_keywords,
		pre_node = source_node.firstElementChild,
		source_info = pre_node.nextElementSibling,
		lines_of_code = pre_node.innerHTML.split('\n').length,
		striped_background = document.createElement("pre");

	striped_background.setAttribute("class", "rear");

	/*
	 * add event handler for additional info
	 */
	if (source_info && source_info.tagName == "CODE")
		source_info.firstChild.onclick = m4_add_info;

	// add stripes to background
	for (let i = 0; i < lines_of_code; i++)
		striped_background.appendChild(document.createElement("div"));

	/*
	 * if the <pre id="m4_highlighted_source_code"></ pre> is ID attribute
	 * and it is referenced by a keyword or several keywords
	 */
	if (all_highlighting_keywords =
		m4_associative_array_of_keywords[pre_node.id]) {

		for (let keyword of all_highlighting_keywords) {

			let lines_to_highlight = keyword.dataset[pre_node.id].split(','),
				stripe = striped_background.childNodes,
				lines_of_code_to_highlight = [];

			for (let line of lines_to_highlight)
				lines_of_code_to_highlight.push(stripe[line - 1]);

			/*
			 * attach mouse event handlers to the keyword in order to
			 * highlight appropriate list items in the parent ordered list
			 */
			keyword.onmouseover = (function(lines) {

				return function() {

					for (let line of lines)
						line.style.backgroundColor='greenyellow';
				}

			})(lines_of_code_to_highlight);

			keyword.onmouseout = (function(lines) {

				return function() {

					for (let line of lines)
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
	 * append the striped element to the DOM tree into source_node
	 * as the first child just before the <pre>…</ pre> tag
	 * Z-index is not explicitly set because the elements are in natural Z order
	 */
	source_node.insertBefore(striped_background, pre_node);
}

EOF]))divert(-1)
]defn([TEST_RESULT_OF_AN_EXTERNAL_COMMAND]))

# forget local β rules (good for frozen files)
popdef(

	[TEST_RESULT_OF_AN_EXTERNAL_COMMAND],

)
