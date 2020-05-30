/* vim:cc=81
 *
 * __HEADER([Josef Kubin], [2020/05/04], [m4root])
 * ___DESCR([adds additional git information to the field with source code])
 * ___POINT([data selected in one mouse click in standard browsers (not MSIE)])
 *
 * /!\ keep all variable names consistent with packer
 */
,
method_add_info: function () {

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
	source_path.appendChild(document.createTextNode(this.nextSibling.title.split('\n')[0]));
	source_info.appendChild(source_date);
	source_info.appendChild(source_path);
	parent_node.appendChild(this.source_info = source_info);
}
