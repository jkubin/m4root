# DO NOT EDIT! This file is generated automatically!

VPATH = gfiles:html

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
TARGETS  += $(FOLDERS_en) $(ARTICLE_en) $(PREVIEW_en) $(PUBLISH_en) $(SPCHECK_en)

#:html-sub-targets/sub/su	creates all files from generated rules
.PHONY: html-sub-targets sub su
html-sub-targets sub su: $(TARGETS)

#:preview/pre/pr/p	as close as possible in real website
.PHONY: preview pre pr p
preview pre pr p: $(PREVIEW)

#:spell/sp	creates files for checking jargon and typos
.PHONY: spell sp
spell sp: $(SPCHECK)

#:publish/pub/pu	creates files in a format suitable for CMS
.PHONY: publish pub pu
publish pub pu: $(PUBLISH)

#:article/art/a	article development
.PHONY: article art a
article art a: $(ARTICLE)

#:all_en/aen/en	creates files in ‘en’ language
.PHONY: all_en aen en
all_en aen en: $(FOLDERS_en) $(ARTICLE_en) $(PREVIEW_en) $(PUBLISH_en) $(SPCHECK_en)

#:clean_en/cl_en/clen/cen	deletes ‘en’ files
.PHONY: clean_en cl_en clen cen
clean_en cl_en clen cen:
	$(RM) -r $(FOLDERS_en)

#:fhtml	disabled for ‘en’
fhtml_en.mk: ;

$(FOLDERS_en):
	mkdir -p $@

generating-code-in-m4-introduction/%.html: $(JAVASCRIPT) rootb.m4 queues.m4 aux.m4 ent.m4 cfg.m4 inline.m4 headings.m4 block.m4 ver.m4 style.m4 lang_en.m4 css.m4 js.m4 git.m4 refs_cs.m4 refs_en.m4 refs_mono.m4 order.m4 lang.m4 incl.m4 file.m4 cmd.m4 %.m4 intro.mc nav.m4
	m4 -DLANG_CODE='en' -DOUTPUT_FILE='$*.html' $(FLAGS)$(filter-out $(JAVASCRIPT), $^) | sed -f html/esc_to_entities.sed > $@
	tidy -qe $@

generating-code-in-m4-introduction/spell.txt: rootb.m4 aux.m4 order.m4 lang.m4 headings.m4 ver.m4 lang_en.m4 refs_cs.m4 refs_en.m4 refs_mono.m4 incl.m4 spell.m4 intro.mc
	m4 -DLANG_CODE='en' -DSOURCE='intro.mc' $(FLAGS)$^ > $@

generating-code-in-m4-introduction/publish.txt: $(JAVASCRIPT) rootb.m4 queues.m4 aux.m4 ent.m4 cfg.m4 inline.m4 headings.m4 block.m4 ver.m4 style.m4 lang_en.m4 css.m4 js.m4 git.m4 refs_cs.m4 refs_en.m4 refs_mono.m4 order.m4 lang.m4 incl.m4 file.m4 cmd.m4 publish.m4 intro.mc nav.m4
	m4 -DLANG_CODE='en' -DSOURCE='intro.mc' $(FLAGS)$(filter-out $(JAVASCRIPT), $^) | sed -f html/publish.sed -f html/esc_to_entities.sed > $@

generating-code-in-m4-fundamentals/%.html: $(JAVASCRIPT) rootb.m4 queues.m4 aux.m4 ent.m4 cfg.m4 inline.m4 headings.m4 block.m4 ver.m4 style.m4 lang_en.m4 css.m4 js.m4 git.m4 refs_cs.m4 refs_en.m4 refs_mono.m4 order.m4 lang.m4 incl.m4 file.m4 cmd.m4 %.m4 fundamentals.mc nav.m4
	m4 -DLANG_CODE='en' -DOUTPUT_FILE='$*.html' $(FLAGS)$(filter-out $(JAVASCRIPT), $^) | sed -f html/esc_to_entities.sed > $@
	tidy -qe $@

generating-code-in-m4-fundamentals/spell.txt: rootb.m4 aux.m4 order.m4 lang.m4 headings.m4 ver.m4 lang_en.m4 refs_cs.m4 refs_en.m4 refs_mono.m4 incl.m4 spell.m4 fundamentals.mc
	m4 -DLANG_CODE='en' -DSOURCE='fundamentals.mc' $(FLAGS)$^ > $@

generating-code-in-m4-fundamentals/publish.txt: $(JAVASCRIPT) rootb.m4 queues.m4 aux.m4 ent.m4 cfg.m4 inline.m4 headings.m4 block.m4 ver.m4 style.m4 lang_en.m4 css.m4 js.m4 git.m4 refs_cs.m4 refs_en.m4 refs_mono.m4 order.m4 lang.m4 incl.m4 file.m4 cmd.m4 publish.m4 fundamentals.mc nav.m4
	m4 -DLANG_CODE='en' -DSOURCE='fundamentals.mc' $(FLAGS)$(filter-out $(JAVASCRIPT), $^) | sed -f html/publish.sed -f html/esc_to_entities.sed > $@

