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

#:article/art/a	generates an article (this is a target for routine article development)
.PHONY: article art a
article art a: $(ARTICLE)

#:all_en/aen/en	generates ‘en’ files
.PHONY: all_en aen en
all_en aen en: $(FOLDERS_en) $(SPCHECK_en) $(PREVIEW_en) $(ARTICLE_en)

#:clean_en/cl_en/clen/cen	deletes ‘en’ files
.PHONY: clean_en cl_en clen cen
clean_en cl_en clen cen:
	$(RM) -r $(FOLDERS_en)

git_en.m4: $(SPCHECK_en) $(PREVIEW_en) $(ARTICLE_en)

#:fhtml	is disabled for ‘en’
fhtml_en.mk: ;

$(FOLDERS_en):
	mkdir -p $@

generating-code-in-m4-introduction/%.html: js/hgl_packed.js js/info_packed.js rootb.m4 html/queues.m4 html/ent.m4 cfg.m4 init.m4 html/inline.m4 headings.m4 html/block.m4 ver.m4 html/style.m4 lang_en.m4 html/css.m4 js.m4 git.m4 refs_cs.m4 refs_en.m4 refs_mono.m4 lang.m4 incl.m4 html/file.m4 html/cmd.m4 html/%.m4 intro.mc html/nav.m4
	m4 -DLANG_CODE='en' -DARTICLE_PATH='generating-code-in-m4-introduction' -DFILE_LIST='intro.mc,fundamentals.mc' -DOUTPUT_FILE='$*.html' $(FLAGS) $(filter-out js/hgl_packed.js js/info_packed.js, $^) | sed -f html/esc_to_ent.sed > $@
	tidy -qe --drop-empty-elements no $@

generating-code-in-m4-introduction/spell.txt: rootb.m4 cfg.m4 lang.m4 headings.m4 ver.m4 lang_en.m4 refs_cs.m4 refs_en.m4 refs_mono.m4 incl.m4 spell.m4 intro.mc
	m4 -DLANG_CODE='en' $(FLAGS) $^ > $@

generating-code-in-m4-introduction/publish.txt: js/hgl_packed.js js/info_packed.js rootb.m4 html/queues.m4 html/ent.m4 cfg.m4 init.m4 html/inline.m4 headings.m4 html/block.m4 ver.m4 html/style.m4 lang_en.m4 html/css.m4 js.m4 git.m4 git_mc.m4 git_en.m4 refs_cs.m4 refs_en.m4 refs_mono.m4 lang.m4 incl.m4 html/file.m4 html/cmd.m4 html/publish.m4 intro.mc html/nav.m4
	m4 -DLANG_CODE='en' -DARTICLE_PATH='generating-code-in-m4-introduction' --define='./$@'='[master]' -DFILE_LIST='intro.mc,fundamentals.mc' $(FLAGS) $(filter-out js/hgl_packed.js js/info_packed.js, $^) | sed -f html/publish.sed -f html/esc_to_ent.sed > $@
	git add $@
	git ci -m 'generated file'

generating-code-in-m4-fundamentals/%.html: js/hgl_packed.js js/info_packed.js rootb.m4 html/queues.m4 html/ent.m4 cfg.m4 init.m4 html/inline.m4 headings.m4 html/block.m4 ver.m4 html/style.m4 lang_en.m4 html/css.m4 js.m4 git.m4 refs_cs.m4 refs_en.m4 refs_mono.m4 lang.m4 incl.m4 html/file.m4 html/cmd.m4 html/%.m4 fundamentals.mc html/nav.m4
	m4 -DLANG_CODE='en' -DARTICLE_PATH='generating-code-in-m4-fundamentals' -DFILE_LIST='intro.mc,fundamentals.mc' -DOUTPUT_FILE='$*.html' $(FLAGS) $(filter-out js/hgl_packed.js js/info_packed.js, $^) | sed -f html/esc_to_ent.sed > $@
	tidy -qe --drop-empty-elements no $@

generating-code-in-m4-fundamentals/spell.txt: rootb.m4 cfg.m4 lang.m4 headings.m4 ver.m4 lang_en.m4 refs_cs.m4 refs_en.m4 refs_mono.m4 incl.m4 spell.m4 fundamentals.mc
	m4 -DLANG_CODE='en' $(FLAGS) $^ > $@

generating-code-in-m4-fundamentals/publish.txt: js/hgl_packed.js js/info_packed.js rootb.m4 html/queues.m4 html/ent.m4 cfg.m4 init.m4 html/inline.m4 headings.m4 html/block.m4 ver.m4 html/style.m4 lang_en.m4 html/css.m4 js.m4 git.m4 git_mc.m4 git_en.m4 refs_cs.m4 refs_en.m4 refs_mono.m4 lang.m4 incl.m4 html/file.m4 html/cmd.m4 html/publish.m4 fundamentals.mc html/nav.m4
	m4 -DLANG_CODE='en' -DARTICLE_PATH='generating-code-in-m4-fundamentals' --define='./$@'='[master]' -DFILE_LIST='intro.mc,fundamentals.mc' $(FLAGS) $(filter-out js/hgl_packed.js js/info_packed.js, $^) | sed -f html/publish.sed -f html/esc_to_ent.sed > $@
	git add $@
	git ci -m 'generated file'

