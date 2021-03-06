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

#:all-txt-en/aten	generates all ‘en’ text and compressed files
.PHONY: all-txt-en aten
all-txt-en aten: $(TEXT_en) $(GZIPPED_TEXT_en) $(XZIPPED_TEXT_en)

#:clean-txt-en/clten/cten	deletes all ‘en’ text and compressed files
.PHONY: clean-txt-en clten cten
clean-txt-en clten cten:
	$(RM) $(TEXT_en) $(GZIPPED_TEXT_en) $(XZIPPED_TEXT_en)

all_en.txt: rootu.m4 countu.m4 config.m4 lang.m4 ver.m4 lang_en.m4 git.m4 refs_cs.m4 refs_en.m4 refs_mono.m4 incl.m4 txt/textdata.m4 txt/cmdfiles.m4 txt/queues.m4 txt/ref.m4 txt/link.m4 txt/txt.m4 intro.mc fundamentals.mc
	m4 -DLANG_CODE='en' -DFILE_LIST='intro.mc,fundamentals.mc' -DPRINT_HEADER -DLINE_NUMBERS $(FLAGS) $^ | sed -f txt/esc_to_txt.sed > $@

generating-code-in-m4-introduction.txt: rootu.m4 countu.m4 config.m4 lang.m4 ver.m4 lang_en.m4 git.m4 refs_cs.m4 refs_en.m4 refs_mono.m4 incl.m4 init.m4 txt/textdata.m4 txt/cmdfiles.m4 txt/queues.m4 txt/ref.m4 txt/link.m4 txt/txt.m4 intro.mc
	m4 -DLANG_CODE='en' -DARTICLE_PATH='generating-code-in-m4-introduction' -DFILE_LIST='intro.mc,fundamentals.mc' -DLINE_NUMBERS $(FLAGS) $^ | sed -f txt/esc_to_txt.sed > $@

generating-code-in-m4-fundamentals.txt: rootu.m4 countu.m4 config.m4 lang.m4 ver.m4 lang_en.m4 git.m4 refs_cs.m4 refs_en.m4 refs_mono.m4 incl.m4 init.m4 txt/textdata.m4 txt/cmdfiles.m4 txt/queues.m4 txt/ref.m4 txt/link.m4 txt/txt.m4 fundamentals.mc
	m4 -DLANG_CODE='en' -DARTICLE_PATH='generating-code-in-m4-fundamentals' -DFILE_LIST='intro.mc,fundamentals.mc' -DLINE_NUMBERS $(FLAGS) $^ | sed -f txt/esc_to_txt.sed > $@

