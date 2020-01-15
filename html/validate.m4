__HEADER([Josef Kubin], [2019/12/27], [root_cz])
___DESCR([creates sample page for HTML validator: https://validator.w3.org/#validate_by_upload])
___POINT([always test the result before publishing])

# A → β
define([IMG_SRC], [$2])

# relative path to other language during development
# A → β
define([OTHER_LANGUAGE], defn([OTHER_LANG_PATH]))

# path for generated files
define([SRC_FILE_PATH], [https://raw.githubusercontent.com/jkubin/m4root/master/])

# name of repository
define([SRC_REPO_NAME], [GitHub])

m4wrap([
	divert(0)dnl
<!-- DONTE() https://validator.w3.org/[#]validate_by_upload -->
<!doctype html>
<html lang="LANG_CODE">
<head>
<meta charset="utf-8">
<title>CAPTION</title>
<meta name="author" content="AUTHOR_NAME">
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
