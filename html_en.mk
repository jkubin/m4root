# DO NOT EDIT! This file is generated automatically!

FOLDERS_en = \
generating-code-in-m4-introduction \
generating-code-in-m4-fundamentals \

ARTICLE_en = $(FOLDERS_en:=/index.html)
PREVIEW_en = $(FOLDERS_en:=/preview.html)
PUBLISH_en = $(FOLDERS_en:=/publish.txt)
SPCHECK_en = $(FOLDERS_en:=/spell.txt)
ARTICLE  += $(FOLDERS_en) $(ARTICLE_en)
FOLDERS  += $(FOLDERS_en)
PREVIEW  += $(FOLDERS_en) $(PREVIEW_en)
PUBLISH  += $(FOLDERS_en) $(PUBLISH_en)
SPCHECK  += $(FOLDERS_en) $(SPCHECK_en)
TARGETS  += $(FOLDERS_en) $(SPCHECK_en) $(PREVIEW_en) $(ARTICLE_en)

#:sub-targets/sub/su	generates all files from generated rules (default target)
.PHONY: sub-targets sub su
sub-targets sub su: $(TARGETS)

#:preview/pre/pr/p	generates html page as close as possible in real website
.PHONY: preview pre pr p
preview pre pr p: $(PREVIEW)

#:spell/spl/sp	generates files for checking jargon and typos
.PHONY: spell spl sp
spell spl sp: $(SPCHECK)

#:publish/pub/pu	generates files in a format suitable for CMS
.PHONY: publish pub pu
publish pub pu: $(PUBLISH)

#:html/article/art/a	generates an article (for development)
.PHONY: html article art a
html article art a: $(ARTICLE)

#:all-en/aen/en	generates ‘en’ files
.PHONY: all-en aen en
all-en aen en: $(FOLDERS_en) $(SPCHECK_en) $(PREVIEW_en) $(ARTICLE_en)

#:clean-en/cl-en/clen/cen	deletes ‘en’ files
.PHONY: clean-en cl-en clen cen
clean-en cl-en clen cen:
	$(RM) -r $(FOLDERS_en)

git_en.m4: $(SPCHECK_en) $(PREVIEW_en) $(ARTICLE_en)

#:fhtml	is disabled for ‘en’
fhtml_en.mk: ;

$(FOLDERS_en):
	mkdir -p $@

generating-code-in-m4-introduction/%.html: js/hgl_packed.js js/info_packed.js js/select_packed.js rootu.m4 countu.m4 html/queues.m4 html/ent.m4 config.m4 init.m4 html/inline.m4 html/block.m4 ver.m4 html/style.m4 lang_en.m4 html/css.m4 js.m4 git.m4 refs_cs.m4 refs_en.m4 refs_mono.m4 lang.m4 incl.m4 html/textdata.m4 html/cmdfiles.m4 html/%.m4 intro.mc html/nav.m4
	m4 -DLANG_CODE='en' -DARTICLE_PATH='generating-code-in-m4-introduction' -DFILE_LIST='intro.mc,fundamentals.mc' -DOUTPUT_FILE='$*.html' $(FLAGS) $(filter-out js/hgl_packed.js js/info_packed.js js/select_packed.js, $^) | sed -f html/esc_to_ent.sed > $@
	tidy -qe --drop-empty-elements no $@

generating-code-in-m4-introduction/spell.txt: rootu.m4 countu.m4 config.m4 lang.m4 ver.m4 lang_en.m4 refs_cs.m4 refs_en.m4 refs_mono.m4 incl.m4 spell.m4 intro.mc
	m4 -DLANG_CODE='en' $(FLAGS) $^ > $@

generating-code-in-m4-introduction/publish.txt: js/hgl_packed.js js/info_packed.js js/select_packed.js rootu.m4 countu.m4 html/queues.m4 html/ent.m4 config.m4 init.m4 html/inline.m4 html/block.m4 ver.m4 html/style.m4 lang_en.m4 html/css.m4 js.m4 git.m4 git_mc.m4 git_en.m4 refs_cs.m4 refs_en.m4 refs_mono.m4 lang.m4 incl.m4 html/textdata.m4 html/cmdfiles.m4 html/publish.m4 intro.mc html/nav.m4
	m4 -DLANG_CODE='en' -DARTICLE_PATH='generating-code-in-m4-introduction' --define='./$@'='master' -DFILE_LIST='intro.mc,fundamentals.mc' $(FLAGS) $(filter-out js/hgl_packed.js js/info_packed.js js/select_packed.js, $^) | sed -f html/publish.sed -f html/esc_to_ent.sed > $@
	git add $@
	git ci -m 'generated file'

generating-code-in-m4-fundamentals/%.html: js/hgl_packed.js js/info_packed.js js/select_packed.js rootu.m4 countu.m4 html/queues.m4 html/ent.m4 config.m4 init.m4 html/inline.m4 html/block.m4 ver.m4 html/style.m4 lang_en.m4 html/css.m4 js.m4 git.m4 refs_cs.m4 refs_en.m4 refs_mono.m4 lang.m4 incl.m4 html/textdata.m4 html/cmdfiles.m4 html/%.m4 fundamentals.mc html/nav.m4
	m4 -DLANG_CODE='en' -DARTICLE_PATH='generating-code-in-m4-fundamentals' -DFILE_LIST='intro.mc,fundamentals.mc' -DOUTPUT_FILE='$*.html' $(FLAGS) $(filter-out js/hgl_packed.js js/info_packed.js js/select_packed.js, $^) | sed -f html/esc_to_ent.sed > $@
	tidy -qe --drop-empty-elements no $@

generating-code-in-m4-fundamentals/spell.txt: rootu.m4 countu.m4 config.m4 lang.m4 ver.m4 lang_en.m4 refs_cs.m4 refs_en.m4 refs_mono.m4 incl.m4 spell.m4 fundamentals.mc
	m4 -DLANG_CODE='en' $(FLAGS) $^ > $@

generating-code-in-m4-fundamentals/publish.txt: js/hgl_packed.js js/info_packed.js js/select_packed.js rootu.m4 countu.m4 html/queues.m4 html/ent.m4 config.m4 init.m4 html/inline.m4 html/block.m4 ver.m4 html/style.m4 lang_en.m4 html/css.m4 js.m4 git.m4 git_mc.m4 git_en.m4 refs_cs.m4 refs_en.m4 refs_mono.m4 lang.m4 incl.m4 html/textdata.m4 html/cmdfiles.m4 html/publish.m4 fundamentals.mc html/nav.m4
	m4 -DLANG_CODE='en' -DARTICLE_PATH='generating-code-in-m4-fundamentals' --define='./$@'='master' -DFILE_LIST='intro.mc,fundamentals.mc' $(FLAGS) $(filter-out js/hgl_packed.js js/info_packed.js js/select_packed.js, $^) | sed -f html/publish.sed -f html/esc_to_ent.sed > $@
	git add $@
	git ci -m 'generated file'

