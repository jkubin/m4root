__HEADER([Josef Kubin], [2019/07/11], [root_cz])
___DESCR([creates preview html page for off-line article development])
___POINT([preview html file])

# A → β
define([AUTHOR_SHORT_DESCRIPTION], LANGW([dnl czech
PERSON([AUTHOR_NAME]) vystudoval Fakultu[]NB()informatiky Masarykovy univerzity v Brně, zabýval se teoretickou informatikou a[]NB()programováním hardware.
Pracuje ve společnosti Red[]NB()Hat v[]NB()ABBR([GSS], [Global Support Services]).
],
[dnl english: _next_language_
PERSON([AUTHOR_NAME]) graduated from the Faculty of Informatics, Masaryk University, where he studied theoretical computer science and hardware programming.
Works at Red[]NB()Hat in[]NB()ABBR([GSS], [Global Support Services]).
]))

# expand the selected language
XLANG([

	# czech
	define([AUTHOR_OF_THE_ARTICLE],		[Autor článku])
	define([AUTHOR_PROFILE],		[Profil autora])
	define([READING_DURATION],		[Doba čtení: BOLD([123 minut])])
	define([WORD_STICKERS],			[Nálepky])

], [

	# english
	define([AUTHOR_OF_THE_ARTICLE],		[Author of the article])
	define([AUTHOR_PROFILE],		[Author's profile])
	define([READING_DURATION],		[Reading time: BOLD([123 minutes])])
	define([WORD_STICKERS],			[Stickers])

])

#      ___________      ______
# --->/ PEREX_IMG \--->/ path \
#     \___________/    \______/
#
# A → β
define([PEREX_IMG], defn([TEST_ATM])[

	# transition to the next node (redefine itself to image path)
	define([$0], ../[$1])
])

# A → β
define([SRC_FILE_PATH], [../])
define([SRC_REPO_NAME], defn([WORD_SRC])[localhost
])

# set local image
# A → β
define([IMG_SRC], [../$1])

# relative path to other language directory during development
# A → ε
define([OTHER_LANGUAGE])

m4wrap([
	divert(0)dnl
<!-- DONTE() -->
<!doctype html>
<html id="css" class="js-inactive" lang="LANG_CODE">
<head>
<meta charset="utf-8">
<title>CAPTION</title>
<link rel="stylesheet" type="text/css" href="../html/preview.css">
divert(HEADER_END_START_BODY)dnl
<meta name="author" content="AUTHOR_NAME">
<meta name="description" content="PEREX">
<meta name="generator" content="M4">
</head>
<body>
<div class="design-page__content">
<div class=" js-sticker-init layout-main--has-sidebar--default layout-main--has-sidebar  layout-main main">
<div class="js-sticker-compare-wrapper layout-columns layout-main__content">
<div class="layout-columns__item--main layout-columns__item">

<div class="design-tile--version-1 design-tile" itemtype="http://schema.org/Article" itemref="microdata-authors microdata-publisher" itemscope>

<!-- Sklik-kontext-start -->
<h1 class="detail__heading design-heading--level-1 design-heading" itemprop="headline">CAPTION</h1>

<div class="detail__perex">
	<div class=" perex">
		<div  style="max-width: 468px"  class=" element-print-hidden  perex__img" itemprop="image" itemtype="http://schema.org/ImageObject" itemscope>
			<img src="PEREX_IMG" itemprop="url" width="468" height="263" alt=" ">
			<meta itemprop="width" content="468">
			<meta itemprop="height" content="263">
		</div>
		<div class=" perex__text--has-reading-duration  perex__text--detail perex__text">
			<div class="perex__text-content">
				<div class="perex__impressum">
						<span class="perex__author">AUTHOR_NAME</span>
						<span class="perex__date">
							<span itemprop="datePublished">ARG1(esyscmd([date '+[%-d. %-m. %Y],']))</span>
						</span>
				</div>
				<p itemprop="description">PEREX</p>
				<div class="perex__reading-duration">
					READING_DURATION
				</div>
			</div>
		</div>
	</div>
</div>

<div class="detail__article" itemprop="articleBody">

<!-- Sklik-kontext-start -->
<div class=" layout-article-content">
<div class="php-urs urs">
divert(END_OF_ARTICLE)dnl
</div>
</div>
<!-- Sklik-kontext-stop -->

</div>
</div>
</div>

<div id="sidebar" class="js-sticker-wrapper sidebar layout-columns__item--sidebar layout-columns__item design-sidebar design-tile--version-2 design-tile">

	<div class="box-actualities--details page-block--actualities page-block design-box">
		<div class="section__header">
			<h2 class="section__heading">
				AUTHOR_OF_THE_ARTICLE
			</h2>
		</div>

		<div id="microdata-authors">
			<div class="author clearfix" itemprop="author" itemtype="http://schema.org/Person" itemscope="">
				<div class="author__pic avatar-round">
					<a class="avatar__wrap" href="[#]" title="AUTHOR_PROFILE">
						<img class="avatar__img" src="../img/defn(AUTHOR_NAME)" width="70" height="70" alt="AUTHOR_NAME">
					</a>
				</div>
				<div class="author__info">
					<div class="row">
						<h3 class="author__name">
							<a href="[#]">
								<span itemprop="name">AUTHOR_NAME</span>
							</a>
						</h3>
	
					</div>
	
					<div class="author__bio urs">
						<p>AUTHOR_SHORT_DESCRIPTION</p>
					</div>
				</div>
			</div>
		</div>

		<div class="row design-impressum__item-wrapper--rubrics design-impressum__item-wrapper">
			<h3 class="rubrics__heading rubrics__heading--sidebar">
				<a class="design-label--empty design-label" href="/n/">WORD_STICKERS:</a>
			</h3>
			<ul class="rubrics__list--sidebar rubrics__list design-list--labels design-list list-reset">
				<li>
					<a class="rubrics__item design-label--default design-label" href="/n/m4/">M4</a>
				</li>
				<li>
					<a class="rubrics__item design-label--default design-label" href="/n/vim/">Vim</a>
				</li>
				<li>
					<a class="rubrics__item design-label--default design-label" href="/n/c-c/">C</a>
				</li>
			</ul>
		</div>
	</div>
</div>
</div>
</div>
</div>
</body>
</html>
])
