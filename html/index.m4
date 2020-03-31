__HEADER([Josef Kubin], [2019/12/27], [m4root])
___DESCR([creates HTML page for off-line article development and validator (tidy)])
___POINT([develop and test the result before publishing])

# set local image
# A → β
define([IMG_SRC], [../$1])

# relative path to other language html page
# A → ε
define([OTHER_LANGUAGE])

# path for generated files
# A → β
#define([SRC_FILE_PATH], [https://raw.githubusercontent.com/jkubin/m4root/ARG1(GIT_RECORD)/])
define([SRC_FILE_PATH], [../])

# name of repository
# A → β
define([SRC_REPO_NAME], defn([WORD_SRC])[localhost
])

m4wrap([
	divert(0)dnl
<!-- vim:wrap
	DONTE()
-->
<!doctype html>
<html lang="LANG_CODE">
<head>
<meta charset="utf-8">
<title>CAPTION</title>
<meta name="author" content="AUTHOR_NAME">
<meta name="generator" content="M4">
<link rel="stylesheet" type="text/css" href="../html/preview.css">
undivert(INTERNAL_STYLE_DATA, INTERNAL_STYLE_END)dnl
</head>
<body class="design-tile layout-article-content">
<div class="urs">
divert(END_OF_ARTICLE)dnl
</div>
</body>
</html>
])
