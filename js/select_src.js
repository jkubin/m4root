/* vim:cc=81
 *
 * __AUTHOR(⟦Josef Kubin⟧, ⟦2020,12,24⟧)
 * ___DESCR(⟦selects source code and puts it into X11 selection clipboard (Linux)⟧)
 * __REASON(⟦makes it easy to select a code with a single mouse click⟧)
 *
 * /!\ keep all variable names consistent with the file html/js_packer.sed
 * because lengthy JavaScript is eventually packed to a smaller one-line script
 */
,
method_select: function () {

	var
		node = this.parentNode.previousSibling,
		text,
		range;

	if (window.getSelection) {
		text = window.getSelection();
		range = document.createRange();
		range.selectNodeContents(node);
		text.removeAllRanges();
		text.addRange(range);
	} else {
		// MSIE
	        range = document.body.createTextRange();
		range.moveToElementText(node);
		range.select();
	}
}
