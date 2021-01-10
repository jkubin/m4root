__HEADER(⟦Josef Kubin⟧, ⟦2019,12,27⟧)
___DESCR(⟦creates a html file for article development⟧)
__REASON(⟦development and preview of html file before publishing⟧)

# set local image
# A → β
define(⟦IMG_SRC⟧, ⟦../$1⟧)

# relative path to other language html page
# A → ε
define(⟦OTHER_LANGUAGE⟧)

# path for files
# A → β
define(⟦SRC_FILE_PATH⟧, ⟦⟦../$1⟧⟧)

# A → β
define(⟦PARTIMAGE⟧, ⟦

	divert(BEGIN_OF_PARTIMAGE)dnl
<div class="design-list--articles--article-detail  design-list--articles--opener design-list--articles design-list list-reset">
<div class="design-list__item">
<div class="design-article--opener--simple design-article--opener design-article--with-image design-article design-tile">
divert(END_OF_PARTIMAGE)dnl
</div>
</div>
</div>
divert(-1)
⟧)

# creates the resulting skeleton
# A → β
define(⟦PART⟧, defn(⟦PART⟧)⟦

	# displays an error if this macro occurs multiple times
	define(⟦$0⟧, ⟦

		ROOT_ERROR(⟦only one source file is allowed⟧)
	⟧)

	divert(0)dnl
<!-- vim:wrap
	DONTE()
-->
<!doctype html>
<html id="css" lang="LANG_CODE">
<head>
<meta charset="utf-8">
<meta name="generator" content="M4">
<title>PART_val</title>
<link rel="stylesheet" type="text/css" href="../html/root_cz.css">
divert(HEADER_END_START_BODY)dnl
</head>
<body id="root" class="js-advert-branding-click-event js-advert-sas-position-mark-background p-text design-page--theme-default design-page--root-cz design-page design-body design-page--has-advert--article-intext-1 design-page--has-advert--as-clanky-300x250 design-page--has-advert--mobile-footer design-page--has-advert--mobile-vignette design-page--has-advert--sidebar-sticky-1 design-page--has-advert--leaderboard design-page--has-advert--rectangle design-page--has-advert--sidebar-sticky-2 design-page--has-advert--megaboard">
<div class="parter-cpex-branding-wrapper design-advert-background-outer-element design-page__content" data-partner-cpex-branding-wrapper-z-index="0"> 
<div class=" js-sticker-init layout-main--has-sidebar--default layout-main--has-sidebar  layout-main main">
<div class="js-sticker-compare-wrapper layout-columns layout-main__content">
<div class="layout-columns__item--main layout-columns__item">
<div class="design-tile--version-1 design-tile">
<h1 class="detail__heading design-heading--level-1 design-heading">PART_val</h1>
divert(BEGIN_OF_ARTICLE)dnl
<div class="detail__article ">
<div class=" layout-article-content">
<div class="element-margin-top-half php-urs urs">
divert(END_OF_DOCUMENT)dnl
</div>
</div>
</div>
</div>
</div> 
</div> 
</div> 
</div>
</body>
</html>
divert(-1)
⟧)

# A → β
define(⟦PARTINTRO⟧, ⟦

	divert(PARTINTRO_BLOCK)dnl
<div class="design-article__text">
<div class="design-article__perex">
<div class="design-article__perex-content">dnl
EXPAND_LANG_CROP_WHITE_CHARS(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦)dnl
</div>
</div>
</div>
divert(-1)
⟧)
