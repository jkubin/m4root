__HEADER(⟦Josef Kubin⟧, ⟦2019/07/11⟧, ⟦root_cz⟧)
___DESCR(⟦creates a preview of the html page for article development⟧)
__REASON(⟦development and preview of html file⟧)

# A → β
define(⟦PARTIMAGE⟧, ⟦

	divert(BEGIN_OF_PARTIMAGE)dnl
<div class="design-list--articles--article-detail  design-list--articles--opener design-list--articles design-list list-reset">
<div class="design-list__item">
<div class="design-article--opener--simple design-article--opener design-article--with-image design-article design-tile">
<span class=" element-print-hidden  design-article__image-outer">
<img class="design-image--responsive design-image design-article__image" src="⟦../$1⟧" width="670" height="377" alt=" ">
<span class="design-article__image-author">AUTHOR_WORD: AUTHOR_NAME_SHORT</span>
</span>
divert(END_OF_PARTIMAGE)dnl
</div>
</div>
</div>
divert(-1)
⟧)

# A → β
define(⟦SRC_FILE_PATH⟧, ⟦⟦../$1⟧⟧)

# set local image
# A → β
define(⟦IMG_SRC⟧, ⟦../$1⟧)

# relative path to other language directory during development
# A → ε
define(⟦OTHER_LANGUAGE⟧)

# creates the resulting skeleton
# A → β
define(⟦PART⟧, defn(⟦PART⟧)⟦

	# displays an error if this macro occurs multiple times
	define(⟦$0⟧, ⟦

		ROOT_ERROR(⟦only one source file is allowed⟧)
	⟧)

	divert(0)dnl
<!-- DONTE() -->
<!doctype html>
<html id="css" lang="LANG_CODE">
<head>
<meta charset="utf-8">
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
<div class="element-margin-top  section ">
<div class="section__header">
<h2 class="section__heading">AUTHOR_OF_THE_ARTICLE</h2>
</div>
<div class="design-box__content">
<div class="author">
<div class="author__pic avatar-round">
<a class="avatar__wrap" href="⟦#⟧" title="AUTHOR_PROFILE">
<img class="avatar__img" src="../img/defn(defn(⟦AUTHOR_NAME⟧))" width="70" height="70" alt="AUTHOR_NAME">
</a>
</div>
<div class="author__info">
<div class="author__details">
<h3 class="author__name">
<a href="https://www.root.cz/autori/">AUTHOR_NAME</a>
</h3>
</div>
<div class="author__bio urs">
<p>AUTHOR_SHORT_DESCRIPTION</p>
</div>
</div>
</div>
</div>
<div class="design-impressum__item-wrapper--rubrics design-impressum__item-wrapper">
<h3 class="element-heading-reset">
<a class="design-label--empty design-label" href="https://www.root.cz/n/">WORD_STICKERS:</a>
</h3>
<ul class="design-list--labels design-list--inline design-list list-reset">
<li>
<a class="design-label--default design-label" href="https://www.root.cz/n/unix/">UNIX</a>
</li>
<li>
<a class="design-label--default design-label" href="https://www.root.cz/n/vim/">Vim</a>
</li>
</ul>
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
EXPAND_LANG_WITHOUT_TRAILING_LF(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦)dnl
</div>
</div>
</div>
divert(-1)
⟧)
