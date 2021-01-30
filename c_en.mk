# DO NOT EDIT! This file is generated automatically!

TEXT_STEM_en = \
generating-code-in-m4-introduction \
generating-code-in-m4-fundamentals \

C_SRC_en  = $(TEXT_STEM_en:=.c)
C_SOURCE += $(C_SRC_en)
TARGETS  += $(C_SRC_en)

#:sub-targets/sub/su	generates all files from generated rules (default target)
.PHONY: sub-targets sub su
sub-targets sub su: $(TARGETS)

#:c	generates C files
.PHONY: c
c: $(C_SRC_en)

git_en.m4: $(C_SRC_en)

#:clean-c-en	deletes all ‘en’ C files
.PHONY: clean-c-en
clean-c-en:
	$(RM) $(C_SRC_en) $(OBJ_en)

generating-code-in-m4-introduction.c: rootu.m4 countu.m4 config.m4 lang.m4 ver.m4 lang_en.m4 git.m4 refs_cs.m4 refs_en.m4 refs_mono.m4 incl.m4 init.m4 c/queues.m4 c/ref.m4 c/link.m4 c/c.m4 intro.mc
	m4 -DLANG_CODE='en' $(FLAGS) $^ > $@

generating-code-in-m4-fundamentals.c: rootu.m4 countu.m4 config.m4 lang.m4 ver.m4 lang_en.m4 git.m4 refs_cs.m4 refs_en.m4 refs_mono.m4 incl.m4 init.m4 c/queues.m4 c/ref.m4 c/link.m4 c/c.m4 fundamentals.mc
	m4 -DLANG_CODE='en' $(FLAGS) $^ > $@

