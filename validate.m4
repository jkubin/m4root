__HEADER([Josef Kubin], [2019/12/27], [root_cz])
___DESCR([creates sample page for HTML validator: https://validator.w3.org/#validate_by_upload])
___POINT([always test the result before publishing])

# A → β
define([IMG_SRC], [$2])

# relative path to other language during development
# A → β
define([OTHER_LANGUAGE], defn([OTHER_LANG_PATH]))

# path for generated files
define([SRC_FILE_PATH], [../])

# name for repository
define([SRC_REPO_NAME], [GitHub])

m4wrap([
	divert(0)dnl
<!-- DONTE() -->
<!doctype html>
<html lang="LANG_CODE">
<head>
<meta charset="utf-8">
<title>CAPTION</title>
undivert(INTERNAL_STYLE_DATA, INTERNAL_STYLE_END)dnl
</head>
<body>
divert(END_OF_ARTICLE)dnl
</body>
</html>
])
