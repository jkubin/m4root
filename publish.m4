__HEADER([Josef Kubin], [2019/12/12], [root_cz])
___DESCR([creates final html code for CMS])
___POINT([separated template for CMS and preview])

# A → β
define([PEREX_IMG], defn([TEST_ATM])[

	# transition to the next node (redefine itself to path)
	define([$0], [$2])
])

# A → β
define([IMG_SRC], [$2])

# relative path to other language during development
# A → β
define([OTHER_LANGUAGE], defn([OTHER_LANG_PATH]))

# path for generated files
define([SRC_FILE_PATH], [https://raw.githubusercontent.com/jkubin/m4root/master/])

# name for repository
define([SRC_REPO_NAME], [GitHub])

m4wrap([
	divert(0)dnl
# caption

CAPTION

# generated path

defn(defn([FILE_PREFIX]).anch)

# perex

PEREX

# perex image

PEREX_IMG

# article body

])
