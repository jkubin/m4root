# DO NOT EDIT! This file is generated automatically!

TEXT_STEM_en = \
generating-code-in-m4-introduction \
generating-code-in-m4-fundamentals \

TEXT_en = $(TEXT_STEM_en:=.txt)
CHAR_COUNT_en = $(TEXT_STEM_en:=.cc)
WORD_COUNT_en = $(TEXT_STEM_en:=.wc)
GZIPPED_TEXT_en = $(TEXT_STEM_en:=.txt.gz)
XZIPPED_TEXT_en = $(TEXT_STEM_en:=.txt.xz)
TEXT    += $(TEXT_en)
TEXT_CC += $(CHAR_COUNT_en)
TEXT_WC += $(WORD_COUNT_en)
TEXT_GZ += $(GZIPPED_TEXT_en)
TEXT_XZ += $(XZIPPED_TEXT_en)
TARGETS += $(TEXT_en)

#:sub-targets/sub/su	generates all files from generated rules (default target)
.PHONY: sub-targets sub su
sub-targets sub su: $(TARGETS)

#:text/txt/tx	generates plain text to specify the length of the article
.PHONY: text txt tx
text txt tx: $(TEXT_en)

#:plain/pla/p1	generates plain text in one file
.PHONY: plain pla p1
plain pla p1: all_en.txt

#:gzt/gt	generates gzipped files
.PHONY: gzt gt
gzt gt: $(GZIPPED_TEXT_en)

#:xzt/xt	generates xzipped files
.PHONY: xzt xt
xzt xt: $(XZIPPED_TEXT_en)

git_en.m4: $(TEXT_en)

#:all-text-en/aten	generates all ‘en’ text and compressed files
.PHONY: all-text-en aten
all-text-en aten: $(TEXT_en) $(GZIPPED_TEXT_en) $(XZIPPED_TEXT_en)

#:clean-text-en/clten/cten	deletes all ‘en’ text and compressed files
.PHONY: clean-text-en clten cten
clean-text-en clten cten:
	$(RM) $(TEXT_en) $(GZIPPED_TEXT_en) $(XZIPPED_TEXT_en)

all_en.txt: rootu.m4 cfg.m4 lang.m4 headings.m4 ver.m4 lang_en.m4 git.m4 refs_cs.m4 refs_en.m4 refs_mono.m4 incl.m4 text/file.m4 text/cmd.m4 text/queues.m4 text/ref.m4 text/link.m4 text/text.m4 intro.mc fundamentals.mc
	m4 -DLANG_CODE='en' -DFILE_LIST='intro.mc,fundamentals.mc' -DPRINT_HEADER -DLINE_NUMBERS $(FLAGS) $^ | sed -f text/esc_to_txt.sed > $@

generating-code-in-m4-introduction.txt: rootu.m4 cfg.m4 lang.m4 headings.m4 ver.m4 lang_en.m4 git.m4 refs_cs.m4 refs_en.m4 refs_mono.m4 incl.m4 init.m4 text/file.m4 text/cmd.m4 text/queues.m4 text/ref.m4 text/link.m4 text/text.m4 intro.mc
	m4 -DLANG_CODE='en' -DFILE_LIST='intro.mc,fundamentals.mc' -DLINE_NUMBERS $(FLAGS) $^ | sed -f text/esc_to_txt.sed > $@

generating-code-in-m4-fundamentals.txt: rootu.m4 cfg.m4 lang.m4 headings.m4 ver.m4 lang_en.m4 git.m4 refs_cs.m4 refs_en.m4 refs_mono.m4 incl.m4 init.m4 text/file.m4 text/cmd.m4 text/queues.m4 text/ref.m4 text/link.m4 text/text.m4 fundamentals.mc
	m4 -DLANG_CODE='en' -DFILE_LIST='intro.mc,fundamentals.mc' -DLINE_NUMBERS $(FLAGS) $^ | sed -f text/esc_to_txt.sed > $@

