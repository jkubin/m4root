# vim:ft=m4

# A → β
# β
define([ERROR], [

	divert(0)dnl
		[<li>$0: <a href="#$1">$1</a></li>]
divert(1)dnl
	<p id="[$1]">$2</p>
divert(-1)
])

# A → β
define([QUERY], defn([ERROR]))
define([WARNING], defn([ERROR]))

divert(0)dnl
<!-- DONTE() -->
<!doctype html>
<html lang="en">
	<meta charset="utf-8">
	<title>__file__</title>
<body>
	<h1>The power of M4</h1>
	<ul>
divert(1)dnl
	</ul>
divert(2)dnl
</body>
</html>
divert(-1)
