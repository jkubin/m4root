/* vim:cc=81
 *
 * __HEADER(⟦Josef Kubin⟧, ⟦2020/05/04⟧, ⟦m4root⟧)
 * ___DESCR(⟦copy additional file information to other element⟧)
 * __REASON(⟦data selected by mouse⟧)
 *
 * /!\ keep all variable names consistent with packer
 */
,
method_add_info: function () {

	var

		parent_node = this.parentNode,
		source_info,
		source_item,
		text_item,
		title_data;

	if (this.source_info) {

		if (this.source_info.isConnected)
			parent_node.removeChild(this.source_info);
		else
			parent_node.appendChild(this.source_info);

		return;
	}

	source_info = document.createElement("div");

	title_data = this.nextSibling.title.split('\n');

	for (text_item of title_data) {

		source_item = document.createElement("div");
		source_item.appendChild(document.createTextNode(text_item));
		source_info.appendChild(source_item);
	}

	parent_node.appendChild(this.source_info = source_info);
}
