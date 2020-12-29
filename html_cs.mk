# DO NOT EDIT! This file is generated automatically!

FOLDERS_cs = \
generovani-kodu-v-m4-uvod \
generovani-kodu-v-m4-zaklady \

ARTICLE_cs = $(FOLDERS_cs:=/index.html)
PREVIEW_cs = $(FOLDERS_cs:=/preview.html)
PUBLISH_cs = $(FOLDERS_cs:=/publish.txt)
SPCHECK_cs = $(FOLDERS_cs:=/spell.txt)
ARTICLE  += $(FOLDERS_cs) $(ARTICLE_cs)
FOLDERS  += $(FOLDERS_cs)
PREVIEW  += $(FOLDERS_cs) $(PREVIEW_cs)
PUBLISH  += $(FOLDERS_cs) $(PUBLISH_cs)
SPCHECK  += $(FOLDERS_cs) $(SPCHECK_cs)
TARGETS  += $(FOLDERS_cs) $(SPCHECK_cs) $(PREVIEW_cs) $(ARTICLE_cs)

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

#:all-cs/acs/cs	generates ‘cs’ files
.PHONY: all-cs acs cs
all-cs acs cs: $(FOLDERS_cs) $(SPCHECK_cs) $(PREVIEW_cs) $(ARTICLE_cs)

#:clean-cs/cl-cs/clcs/ccs	deletes ‘cs’ files
.PHONY: clean-cs cl-cs clcs ccs
clean-cs cl-cs clcs ccs:
	$(RM) -r $(FOLDERS_cs)

git_cs.m4: $(SPCHECK_cs) $(PREVIEW_cs) $(ARTICLE_cs)

#:fhtml	is disabled for ‘cs’
fhtml_cs.mk: ;

$(FOLDERS_cs):
	mkdir -p $@

generovani-kodu-v-m4-uvod/%.html: js/hgl_packed.js js/info_packed.js js/select_packed.js rootu.m4 html/queues.m4 html/ent.m4 config.m4 init.m4 html/inline.m4 headings.m4 html/block.m4 ver.m4 html/style.m4 lang_cs.m4 html/css.m4 js.m4 git.m4 refs_en.m4 refs_cs.m4 refs_mono.m4 lang.m4 incl.m4 html/file.m4 html/cmd.m4 html/%.m4 intro.mc html/nav.m4
	m4 -DLANG_CODE='cs' -DARTICLE_PATH='generovani-kodu-v-m4-uvod' -DFILE_LIST='intro.mc,fundamentals.mc' -DOUTPUT_FILE='$*.html' $(FLAGS) $(filter-out js/hgl_packed.js js/info_packed.js js/select_packed.js, $^) | sed -f html/esc_to_ent.sed > $@
	tidy -qe --drop-empty-elements no $@

generovani-kodu-v-m4-uvod/spell.txt: rootu.m4 config.m4 lang.m4 headings.m4 ver.m4 lang_cs.m4 refs_en.m4 refs_cs.m4 refs_mono.m4 incl.m4 spell.m4 intro.mc
	m4 -DLANG_CODE='cs' $(FLAGS) $^ > $@

generovani-kodu-v-m4-uvod/publish.txt: js/hgl_packed.js js/info_packed.js js/select_packed.js rootu.m4 html/queues.m4 html/ent.m4 config.m4 init.m4 html/inline.m4 headings.m4 html/block.m4 ver.m4 html/style.m4 lang_cs.m4 html/css.m4 js.m4 git.m4 git_mc.m4 git_cs.m4 refs_en.m4 refs_cs.m4 refs_mono.m4 lang.m4 incl.m4 html/file.m4 html/cmd.m4 html/publish.m4 intro.mc html/nav.m4
	m4 -DLANG_CODE='cs' -DARTICLE_PATH='generovani-kodu-v-m4-uvod' --define='./$@'='master' -DFILE_LIST='intro.mc,fundamentals.mc' $(FLAGS) $(filter-out js/hgl_packed.js js/info_packed.js js/select_packed.js, $^) | sed -f html/publish.sed -f html/esc_to_ent.sed > $@
	git add $@
	git ci -m 'generated file'

generovani-kodu-v-m4-zaklady/%.html: js/hgl_packed.js js/info_packed.js js/select_packed.js rootu.m4 html/queues.m4 html/ent.m4 config.m4 init.m4 html/inline.m4 headings.m4 html/block.m4 ver.m4 html/style.m4 lang_cs.m4 html/css.m4 js.m4 git.m4 refs_en.m4 refs_cs.m4 refs_mono.m4 lang.m4 incl.m4 html/file.m4 html/cmd.m4 html/%.m4 fundamentals.mc html/nav.m4
	m4 -DLANG_CODE='cs' -DARTICLE_PATH='generovani-kodu-v-m4-zaklady' -DFILE_LIST='intro.mc,fundamentals.mc' -DOUTPUT_FILE='$*.html' $(FLAGS) $(filter-out js/hgl_packed.js js/info_packed.js js/select_packed.js, $^) | sed -f html/esc_to_ent.sed > $@
	tidy -qe --drop-empty-elements no $@

generovani-kodu-v-m4-zaklady/spell.txt: rootu.m4 config.m4 lang.m4 headings.m4 ver.m4 lang_cs.m4 refs_en.m4 refs_cs.m4 refs_mono.m4 incl.m4 spell.m4 fundamentals.mc
	m4 -DLANG_CODE='cs' $(FLAGS) $^ > $@

generovani-kodu-v-m4-zaklady/publish.txt: js/hgl_packed.js js/info_packed.js js/select_packed.js rootu.m4 html/queues.m4 html/ent.m4 config.m4 init.m4 html/inline.m4 headings.m4 html/block.m4 ver.m4 html/style.m4 lang_cs.m4 html/css.m4 js.m4 git.m4 git_mc.m4 git_cs.m4 refs_en.m4 refs_cs.m4 refs_mono.m4 lang.m4 incl.m4 html/file.m4 html/cmd.m4 html/publish.m4 fundamentals.mc html/nav.m4
	m4 -DLANG_CODE='cs' -DARTICLE_PATH='generovani-kodu-v-m4-zaklady' --define='./$@'='master' -DFILE_LIST='intro.mc,fundamentals.mc' $(FLAGS) $(filter-out js/hgl_packed.js js/info_packed.js js/select_packed.js, $^) | sed -f html/publish.sed -f html/esc_to_ent.sed > $@
	git add $@
	git ci -m 'generated file'

