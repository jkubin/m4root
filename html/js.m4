__HEADER([Josef Kubin], [2020/03/08], [html])
___DESCR([various JavaScripts for html code])
___POINT([static html generated by M4 and completed on the client side by JavaScript])

divert(JAVASCRIPT_CODE)dnl
<script>
var m4_src = document.getElementsByClassName("ADD_CLASS([src])");
for (var e of m4_src) {
	var l = e.lastChild.innerHTML.split('\n').length + 1;
	var o = document.createElement("ol");

	for (var i = 1; i < l; i++)
		o.appendChild(document.createElement("li"));

	e.appendChild(o);
}
divert(JAVASCRIPT_CODE_END)dnl
</script>
divert(-1)
