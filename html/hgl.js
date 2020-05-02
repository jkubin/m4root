// vim:cc=81

/*
 * /!\ keep all variable names consistent with the file html/js_packer.sed
 * because lengthy JavaScript is eventually packed to a smaller one-line script
 *
 *
 * The only global JavaScript symbol is: M3_is_beautiful
 *
 * It's not irony, it's an unrecognized truth.
 * I am pretty sure it will not conflict with any name today.
 */

function M4_is_beautiful(all_keywords, all_sources,
	classname_for_striped_bckg, default_color) {

var

	different_color,
	hgl_item,
	hgl_keyword,
	highlighting_classes = [],
	highlighting_lines,
	highlighting_sequence = [],
	i,
	last_line,
	line_range,
	lines_of_code,
	lines_to_highlight,
	parsed_json,
	pre_node,
	resulting_color,
	source_indexes,
	source_info,
	source_node,
	striped_background;

/*
 * copy information from attributes to a dedicated element
 * this is important for the development of the articles
 * in order to copy&paste embedded data in one mouse click
 * made for standard browsers (not MSIE) that I use
 */
function add_info() {

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

	// MSIE ignores it
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

/*
 * adds shaded stripes behind the source code
 */
for (source_node of all_sources) {

	pre_node = source_node.firstElementChild,
	lines_of_code = pre_node.innerHTML.split('\n').length,
	source_info = pre_node.nextElementSibling;

	/*
	 * the <pre>…</ pre> tag is used as a stripe container because it has exactly
	 * the same CSS paddings, line-size, corners, …, as the <pre>…</ pre> with
	 * a source code; stripe sizes will follow every CSS future change in
	 * the <pre>…</ pre> tag
	 */
	striped_background = document.createElement("pre");
	striped_background.className = classname_for_striped_bckg;

	/*
	 * adds an event handler to display additional source code information
	 */
	if (source_info && source_info.tagName == "CODE")
		source_info.firstChild.onclick = add_info;

	/*
	 * creates and appends stripes
	 */
	for (i = 0; i < lines_of_code; i++)
		striped_background.appendChild(document.createElement("div"));

	/*
	 * appends the final element to the DOM tree into source node as
	 * the first child just behind the <pre>…</ pre> tag
	 * Z-index is not explicitly set because the elements are in natural Z order
	 */
	source_node.insertBefore(striped_background, pre_node);

	// set the transparency of the source code background
	pre_node.style.background = "none";
}

/*
 * the JavaScript processes datasets from <tag data-0="…">keyword</ tag> in the
 * following JSON-like format (quotes are omitted):
 *
 * data-0="1"
 * data-0="1,2,3"
 * data-0="1-3"
 * data-0="1-3,5,7-9"
 * data-0=":[1,2,3,5],red:[7,8,9],#abc:[10]"
 * data-0=":[1-3,5],red:[7-9]"
 *         ^^^^^^^^
 * highlights lines by default color (it is always the first pseudo-JSON item)
 *
 * data-0=":[A,B,C,1-3,5],red:[7-9]"
 *           ^^^^^
 * highlights all strings in the source code marked by classes a,b,c
 *
 * the following code connects keywords with the appropriate lines
 * of source code for interactive line highlighting (onmouseover)
 */
for (hgl_keyword of all_keywords) {

	/*
	 * indexes from a dataset to select several source code fields
	 * data-0="6" data-1="8" → [0, 1]
	 */
	source_indexes = Object.keys(hgl_keyword.dataset);

	/*
	 * unfold each dataset item into separated arrays
	 * associated with the source code
	 */
	for (i of source_indexes) {

		source_node = all_sources[i];

		// create a custom attribute to the object
		if (!source_node.highlighting_keywords)
			source_node.highlighting_keywords = [];

		/*
		 * adds a value from data set to source node
		 * data-1="8" → "8"
		 */
		source_node.highlighting_keywords.push({
			node: hgl_keyword,
			value: hgl_keyword.dataset[i]
		});
	}

	/*
	 * attach mouse event handlers to a keyword
	 */
	hgl_keyword.onmouseover = function() {

		var hgl_item;

		if (this.highlighting_lines)
			for (hgl_item of this.highlighting_lines)
				hgl_item.node.style.backgroundColor = hgl_item.value;

		if (this.highlighting_classes)
			for (hgl_item of this.highlighting_classes)
				hgl_item.node.classList.add(...hgl_item.value);
	};

	hgl_keyword.onmouseout = function() {

		var hgl_item;

		if (this.highlighting_lines)
			for (hgl_item of this.highlighting_lines)
				hgl_item.node.style=null;

		if (this.highlighting_classes)
			for (hgl_item of this.highlighting_classes)
				hgl_item.node.classList.remove(...hgl_item.value);
	};
}

/*
 * if the source node is referenced by a keyword or several keywords
 */
for (source_node of all_sources) {

	/*
	 * if no keyword refers to the source code
	 */
	if (!source_node.highlighting_keywords)
		continue;

	striped_background = source_node.firstElementChild;

	for (hgl_item of source_node.highlighting_keywords) {

		/*
		 * the first step is to transform input pseudo-JSON using regexp
		 */
		hgl_item.value =
			hgl_item.value.replace(/[A-Z]|[a-z]+|#[\da-f]{3,6}|\d+-\d+/g,
				'"$&"').replace(/^:/, '"":');

		/*
		 * wraps the processed string in parentheses to the raw JSON string
		 */
		hgl_item.value =
			/:/.test(hgl_item.value) ?
			"{" + hgl_item.value + "}" :
			'{"":[' + hgl_item.value + ']}';

		/*
		 * converts raw string to a final structured JSON data
		 * the data contains only color names and line numbers
		 */
		parsed_json = JSON.parse(hgl_item.value, function (key, value) {

			/*
			 * extracts capital letters for highlighting classes
			 */
			if (/^[A-Z]$/.test(value)) {

				highlighting_classes.push(value);

				/*
				 * removes a letter from the final JSON
				 */
				return undefined;
			}

			/*
			 * expands string range to a numeric sequence
			 * for example: "1-3" → [0, 1, 2]
			 */
			if (/^\d+-\d+$/.test(value)) {

				line_range = value.split('-');
				last_line = parseInt(line_range[1]);

				for (i = line_range[0] - 1; i < last_line; i++)
					highlighting_sequence.push(i);

				/*
				 * removes the string "1-3" from the final JSON
				 */
				return undefined;
			}

			/*
			 * converts line numbers to the index for an array
			 * removes forbidden integer values
			 */
			if (Number.isInteger(value))
				return value > 0 ?
					value - 1 :
					undefined;

			/*
			 * creates the final array from an expanded array and integers
			 */
			if (Array.isArray(value)) {

				/*
				 * converts a sparse array to dense array
				 * concatenates numeric sequence(s)
				 */
				value = value.filter(function () {
					return true;
				}).concat(highlighting_sequence);

				highlighting_sequence = [];

				/*
				 * if concatenated array is empty, removes it
				 */
				return value.length ?
					value :
					undefined;
			}

			/*
			 * there are possible modifications of the final JSON
			 * object (the final JSON is not modified)
			 */
			if (typeof value === 'object')
				return value;

			/*
			 * everything else from the input is thrown away
			 */
			return undefined;
		});

		/*
		 * append higlighting classes and a source code to a keyword
		 */
		if (highlighting_classes.length) {

			// create a custom attribute to the object
			if (!hgl_item.node.highlighting_classes)
				hgl_item.node.highlighting_classes = [];

			hgl_item.node.highlighting_classes.push({
				node: source_node,
				value: highlighting_classes
			});

			highlighting_classes = [];
		}

		highlighting_lines = Object.keys(parsed_json);

		/*
		 * if the final JSON is not empty
		 */
		if (highlighting_lines.length) {

			// create a custom attribute to the object
			if (!hgl_item.node.highlighting_lines)
				hgl_item.node.highlighting_lines = [];

			/*
			 * iterate color names and select appropriate arrays of
			 * lines to highlight
			 */
			for (different_color of highlighting_lines) {

				lines_to_highlight = parsed_json[different_color];

				/*
				 * set a default color, if the color name is empty
				 * "": [1, 2, 3] → "a_default_color": [1, 2, 3]
				 */
				resulting_color =
					different_color ?
					different_color :
					default_color;

				/*
				 * appends array of data to the keyword
				 * which stripes to highlight
				 */
				for (i of lines_to_highlight)
					hgl_item.node.highlighting_lines.push({
						node: striped_background.children[i],
						value: resulting_color
					});
			}
		}
	}
}
}
