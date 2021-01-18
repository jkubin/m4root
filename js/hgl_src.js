/* vim:cc=81
 *
 * __AUTHOR(⟦Josef Kubin⟧, ⟦2020,05,02⟧)
 * ___DESCR(⟦auxiliary JavaScript to highlight lines behind the source code⟧)
 * __REASON(⟦source code is easier to understand; the necessary HTML attributes for JavaScript are generated by M4⟧)
 *
 * /!\ keep all variable names consistent with packer
 */

init: function (
	all_keywords,
	all_sources,
	all_commands,
	namespace_prefix,
	striped_background_classname,
	colored_stripe_classname,
	default_class) {

	var

		another_class,
		colored_stripe,
		counter_reset,
		hgl_item,
		hgl_keyword,
		hgl_range,
		highlighting_lines,
		highlighting_sequence = [],
		highlighting_words = [],
		i,
		last_line,
		lines_of_code,
		lines_to_highlight,
		parsed_json,
		pre_node,
		resulting_class,
		source_indexes,
		source_info,
		source_node,
		striped_background;

	/*
	 * adds onclick event handler for selection of a command line
	 */
	for (source_node of all_commands)
		source_node.lastChild.firstChild.onclick = this.method_select;

	/*
	 * adds shaded stripes behind the source code
	 */
	for (source_node of all_sources) {

		pre_node = source_node.pre_node = source_node.firstElementChild,
			lines_of_code = pre_node.innerHTML.split('\n').length,
			source_info = pre_node.nextElementSibling;

		/*
		 * the <pre>…</ pre> tag is used as a stripe container because it has exactly
		 * the same CSS paddings, line-size, corners, …, as the <pre>…</ pre> with
		 * a source code; stripe sizes will follow every CSS future change in
		 * the <pre>…</ pre> tag
		 */
		striped_background = document.createElement("pre");
		striped_background.className = striped_background_classname;

		/*
		 * display additional source code information
		 */
		if (source_info && source_info.tagName == "CODE") {

			if (source_info.childNodes.length == 2) {
				source_info.firstChild.onclick = this.method_select;
			} else {
				source_info.firstChild.onclick = this.method_add_info;
				source_info.childNodes[2].onclick = this.method_select;
			}
			// source_info.firstChild.onclick = this.method_add_info;
			// source_info.firstChild.title = "git …";
		}

		/*
		 * creates and appends stripes
		 * even stripes have class attribute
		 */
		for (i = 0; i < lines_of_code; i++) {

			colored_stripe = document.createElement("div");

			if (i & 1)
				colored_stripe.className = colored_stripe_classname;

			striped_background.appendChild(colored_stripe);
		}

		/*
		 * appends the final element to the DOM tree into source node as
		 * the first child just behind the <pre>…</ pre> tag
		 * Z-index is not explicitly set because the elements are in natural Z order
		 */
		source_node.insertBefore(striped_background, pre_node);
	}

	/*
	 * the JavaScript processes datasets from <tag data-0="…">keyword</ tag>
	 * in the following input pseudo-JSON format
	 *
	 * data-0="1"
	 * data-0="1,2,3"
	 * data-0="1-3"
	 * data-0="1-3,5,7-9"
	 * data-0=":[1,2,3,5],my_red:[7,8,9],my_coloring_class:[10]"
	 * data-0=":[1-3,5],my_red:[7-9]"
	 *         ^^^^^^^^
	 * highlights lines by default color (it is always the first pseudo-JSON item)
	 *
	 * data-0=":[A,B,C,1-3,5],my_red:[7-9]"
	 *           ^^^^^
	 * highlights background in all descendant strings in the source code
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
					hgl_item.node.classList.add(hgl_item.value);

			if (this.highlighting_words)
				for (hgl_item of this.highlighting_words)
					hgl_item.node.classList.add(...hgl_item.value);
		};

		hgl_keyword.onmouseout = function() {

			var hgl_item;

			if (this.highlighting_lines)
				for (hgl_item of this.highlighting_lines)
					hgl_item.node.classList.remove(hgl_item.value);

			if (this.highlighting_words)
				for (hgl_item of this.highlighting_words)
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

		/*
		 * the source code snippet in HTML can start from any line,
		 * not just the first line
		 *
		 * the script reads the first line number of the source code
		 * from the style attribute if it differs from 1
		 *
		 * for example, if the source code begins on line 5:
		 * style="counter-reset:m4-nl 5"
		 */
		counter_reset = 1;

		if (source_node.style.counterReset)
			counter_reset += parseInt(source_node.style.counterReset.split(' ')[1]);

		striped_background = source_node.firstElementChild;

		for (hgl_item of source_node.highlighting_keywords) {

			/*
			 * the first step is to transform the pseudo-JSON input
			 * using regex to standard JSON
			 */
			hgl_item.value =
				hgl_item.value.replace(/[A-Z]+|[_a-z]\w*|\d+-\d+/g,
					'"$&"').replace(/^:/, '"":');

			/*
			 * wraps the processed string in parentheses to the raw
			 * well structured JSON string (not tested yet)
			 */
			hgl_item.value =
				/:/.test(hgl_item.value) ?
				"{" + hgl_item.value + "}" :
				'{"":[' + hgl_item.value + ']}';

			/*
			 * converts raw string to a final structured JSON data
			 * the data contains only class names and line numbers
			 */
			parsed_json = JSON.parse(hgl_item.value, function (key, value) {

				/*
				 * extracts uppercase class names for highlight sets
				 */
				if (/^[A-Z]+$/.test(value)) {

					highlighting_words.push(namespace_prefix + value);

					/*
					 * removes the letter from the final JSON
					 */
					return undefined;
				}

				/*
				 * expands string range to a numeric sequence
				 * for example: "1-3" → [0, 1, 2]
				 */
				if (/^\d+-\d+$/.test(value)) {

					hgl_range = value.split('-');
					last_line = parseInt(hgl_range[1]);

					for (i = hgl_range[0]; i <= last_line; i++) {

						value = i - counter_reset;

						if (value >= 0)
							highlighting_sequence.push(value);
					}

					/*
					 * removes the string "1-3" from the final JSON
					 */
					return undefined;
				}

				/*
				 * converts line numbers to the index for an array
				 * removes negative integers
				 */
				if (Number.isInteger(value)) {

					value -= counter_reset;

					return value >= 0 ? value : undefined;
				}

				/*
				 * creates the final array from an expanded array and integers
				 */
				if (Array.isArray(value)) {

					/*
					 * converts a sparse array to dense array
					 * and concatenates numeric sequence(s)
					 */
					value = value.filter(function () {
						return true;
					}).concat(highlighting_sequence);

					highlighting_sequence = [];

					/*
					 * if the resulting concatenated array
					 * is empty, it is removed
					 */
					return value.length ? value : undefined;
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
			if (highlighting_words.length) {

				// create a custom attribute to the object
				if (!hgl_item.node.highlighting_words)
					hgl_item.node.highlighting_words = [];

				hgl_item.node.highlighting_words.push({
					node: source_node.pre_node,
					value: highlighting_words
				});

				highlighting_words = [];
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
				for (another_class of highlighting_lines) {

					lines_to_highlight = parsed_json[another_class];

					/*
					 * set the default color class, if
					 * the class name is empty
					 * "": [1, 2, 3] → "default_class": [1, 2, 3]
					 */
					resulting_class = another_class ?
						namespace_prefix + another_class :
						default_class;

					/*
					 * appends array of data to the keyword
					 * which stripes to highlight
					 */
					for (i of lines_to_highlight)
						hgl_item.node.highlighting_lines.push({
							node: striped_background.children[i],
							value: resulting_class
						});
				}
			}
		}
	}
}
