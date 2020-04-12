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
 * Notes:
 * /!\ keep all global variables in the dedicated namespace: m4_*
 * /!\ keep all variable names consistent with the file js_compress.js because
 * lengthy JavaScript is eventually compressed to a smaller one-line script
 *
 * NSP() is a global CSS namespace prefix defined in the configuration file
 */

/*
 * copy information from attributes to dedicated element
 * this is important for the development of articles
 * in order to copy&paste embedded data in one mouse click
 * made for standard browsers (not IE) that I use
 */
function m4_add_info() {

	var
		parent_node = this.parentNode,
		source_date,
		source_info,
		source_path;

	if (this.source_info) {

		if (this.source_info.isConnected)
			parent_node.removeChild(this.source_info);
		else
			parent_node.appendChild(this.source_info);

		return;
	}

	source_date = document.createElement("div");
	source_info = document.createElement("div");
	source_path = document.createElement("div");

	if (window.getSelection)
		source_date.onclick = source_path.onclick = function () {
			const selected_text = window.getSelection();
			const selected_range = document.createRange();
			selected_range.selectNodeContents(this);
			selected_text.removeAllRanges();
			selected_text.addRange(selected_range);
		};

	source_date.appendChild(document.createTextNode(this.title));
	source_path.appendChild(document.createTextNode(this.nextSibling.title.split('\n')[1]));
	source_info.appendChild(source_date);
	source_info.appendChild(source_path);
	parent_node.appendChild(this.source_info = source_info);
}

let m4_sources = document.getElementsByClassName("]NSP()[src"),
	m4_keywords = document.getElementsByClassName("]NSP()[hgl");

/*
 * shaded stripes to source code
 * additional information that the onclick handler displays
 */
for (let source_node of m4_sources) {

	let
		line,
		pre_node = source_node.firstElementChild,
		lines_of_code = pre_node.innerHTML.split('\n').length,
		source_info = pre_node.nextElementSibling,
		striped_background = document.createElement("pre");

	striped_background.className = "rear";

	/*
	 * add event handler for additional info
	 */
	if (source_info && source_info.tagName == "CODE")
		source_info.firstChild.onclick = m4_add_info;

	/*
	 * create and append stripes
	 */
	for (line = 0; line < lines_of_code; line++)
		striped_background.appendChild(document.createElement("div"));

	/*
	 * append the element with stripes to the DOM tree into source node as
	 * the first child just before the <pre>…</ pre> tag
	 * Z-index is not explicitly set because the elements are in natural Z order
	 */
	source_node.insertBefore(striped_background, pre_node);
}

/*
 * the following code finds keywords pointing to the preformatted-source-code
 * the following code links keywords with the appropriate lines
 * of source code which highlights
 */
for (let hgl_keyword of m4_keywords) {

	let
		item,
		source_indexes = Object.keys(hgl_keyword.dataset),
		source_node;

	/*
	 * unfold each dataset item into separated arrays
	 * associated with the source code
	 */
	for (item of source_indexes) {

		source_node = m4_sources[item];

		if (!source_node.highlighting_keywords)
			source_node.highlighting_keywords = [];

		source_node.highlighting_keywords.push({
			node: hgl_keyword,
			value: hgl_keyword.dataset[item]
		});
	}
}

/*
 * if the source node is referenced by keyword or several keywords
 */
for (let source_node of m4_sources) {

	if (source_node.highlighting_keywords) {

		let
			color_item,
			color_json,
			color_names,
			color_resulting,
			end_line,
			line,
			item,
			lines_to_highlight,
			num_range,
			striped_background = source_node.firstElementChild;

		for (item of source_node.highlighting_keywords) {

			if (item.value.indexOf(":") > -1)
				color_json = JSON.parse("{" + item.value + "}");
			else if (item.value.indexOf("-") > -1)
				color_json = {"": item.value};
			else
				color_json = {"": JSON.parse("[" + item.value + "]")};

			if (!item.node.highlight_lines)
				item.node.highlight_lines = [];

			color_names = Object.keys(color_json);

			for (color_item of color_names) {

				lines_to_highlight = color_json[color_item];
				color_resulting = color_item ? color_item : "]defn([DEFAULT_HIGHLIGHT_COLOR])[";

				if (typeof lines_to_highlight === "string") {

					num_range = lines_to_highlight.split('-');
					end_line = parseInt(num_range[1]);

					for (line = num_range[0] - 1; line < end_line; line++)
						item.node.highlight_lines.push({
							node: striped_background.children[line],
							value: color_resulting
						});

				} else
					for (line of lines_to_highlight)
						item.node.highlight_lines.push({
							node: striped_background.children[line - 1],
							value: color_resulting
						});
			}
		}
	}
}

/*
 * attach event handlers to the keyword in order to highlight appropriate lines
 */
for (let hgl_keyword of m4_keywords) {

	hgl_keyword.onmouseover = function() {

		for (let line of this.highlight_lines)
			line.node.style.backgroundColor = line.value;
	};

	hgl_keyword.onmouseout = function() {

		for (let line of this.highlight_lines)
			line.node.style=null;
	};
}

EOF]))divert(-1)
]defn([TEST_RESULT_OF_AN_EXTERNAL_COMMAND]))

# forget local β rules (good for frozen files)
popdef(

	[TEST_RESULT_OF_AN_EXTERNAL_COMMAND],

)
