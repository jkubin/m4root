# DO NOT EDIT! This file is generated automatically!

TEXT_STEM_cs = \
generovani-kodu-v-m4-uvod \
generovani-kodu-v-m4-zaklady \

TEXT_cs = $(TEXT_STEM_cs:=.txt)
CHAR_COUNT_cs = $(TEXT_STEM_cs:=.cc)
WORD_COUNT_cs = $(TEXT_STEM_cs:=.wc)
GZIPPED_TEXT_cs = $(TEXT_STEM_cs:=.txt.gz)
XZIPPED_TEXT_cs = $(TEXT_STEM_cs:=.txt.xz)
TEXT    += $(TEXT_cs)
TEXT_CC += $(CHAR_COUNT_cs)
TEXT_WC += $(WORD_COUNT_cs)
TEXT_GZ += $(GZIPPED_TEXT_cs)
TEXT_XZ += $(XZIPPED_TEXT_cs)
TARGETS += $(TEXT_cs)

#:sub-targets/sub/su	generates all files from generated rules (default target)
.PHONY: sub-targets sub su
sub-targets sub su: $(TARGETS)

#:text/txt/tx	generates plain text to specify the length of the article
.PHONY: text txt tx
text txt tx: $(TEXT_cs)

#:plain/pla/p1	generates plain text in one file
.PHONY: plain pla p1
plain pla p1: all_cs.txt

#:gzt/gt	generates gzipped files
.PHONY: gzt gt
gzt gt: $(GZIPPED_TEXT_cs)

#:xzt/xt	generates xzipped files
.PHONY: xzt xt
xzt xt: $(XZIPPED_TEXT_cs)

git_cs.m4: $(TEXT_cs)

#:all-text-cs/atcs	generates all ‘cs’ text and compressed files
.PHONY: all-text-cs atcs
all-text-cs atcs: $(TEXT_cs) $(GZIPPED_TEXT_cs) $(XZIPPED_TEXT_cs)

#:clean-text-cs/cltcs/ctcs	deletes all ‘cs’ text and compressed files
.PHONY: clean-text-cs cltcs ctcs
clean-text-cs cltcs ctcs:
	$(RM) $(TEXT_cs) $(GZIPPED_TEXT_cs) $(XZIPPED_TEXT_cs)

all_cs.txt: rootu.m4 config.m4 lang.m4 headings.m4 ver.m4 lang_cs.m4 git.m4 refs_en.m4 refs_cs.m4 refs_mono.m4 incl.m4 text/file.m4 text/cmd.m4 text/queues.m4 text/ref.m4 text/link.m4 text/text.m4 intro.mc fundamentals.mc
	m4 -DLANG_CODE='cs' -DFILE_LIST='intro.mc,fundamentals.mc' -DPRINT_HEADER -DLINE_NUMBERS $(FLAGS) $^ | sed -f text/esc_to_txt.sed > $@

generovani-kodu-v-m4-uvod.txt: rootu.m4 config.m4 lang.m4 headings.m4 ver.m4 lang_cs.m4 git.m4 refs_en.m4 refs_cs.m4 refs_mono.m4 incl.m4 init.m4 text/file.m4 text/cmd.m4 text/queues.m4 text/ref.m4 text/link.m4 text/text.m4 intro.mc
	m4 -DLANG_CODE='cs' -DARTICLE_PATH='generovani-kodu-v-m4-uvod' -DFILE_LIST='intro.mc,fundamentals.mc' -DLINE_NUMBERS $(FLAGS) $^ | sed -f text/esc_to_txt.sed > $@

generovani-kodu-v-m4-zaklady.txt: rootu.m4 config.m4 lang.m4 headings.m4 ver.m4 lang_cs.m4 git.m4 refs_en.m4 refs_cs.m4 refs_mono.m4 incl.m4 init.m4 text/file.m4 text/cmd.m4 text/queues.m4 text/ref.m4 text/link.m4 text/text.m4 fundamentals.mc
	m4 -DLANG_CODE='cs' -DARTICLE_PATH='generovani-kodu-v-m4-zaklady' -DFILE_LIST='intro.mc,fundamentals.mc' -DLINE_NUMBERS $(FLAGS) $^ | sed -f text/esc_to_txt.sed > $@

