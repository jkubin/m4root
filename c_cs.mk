# DO NOT EDIT! This file is generated automatically!

TEXT_STEM_cs = \
generovani-kodu-v-m4-uvod \
generovani-kodu-v-m4-zaklady \

C_SRC_cs  = $(TEXT_STEM_cs:=.c)
C_SOURCE += $(C_SRC_cs)
TARGETS  += $(C_SRC_cs)

#:sub-targets/sub/su	generates all files from generated rules (default target)
.PHONY: sub-targets sub su
sub-targets sub su: $(TARGETS)

#:c	generates C files
.PHONY: c
c: $(C_SRC_cs)

git_cs.m4: $(C_SRC_cs)

#:clean-c-cs	deletes all ‘cs’ C files
.PHONY: clean-c-cs
clean-c-cs:
	$(RM) $(C_SRC_cs) $(OBJ_cs)

generovani-kodu-v-m4-uvod.c: rootu.m4 countu.m4 config.m4 lang.m4 ver.m4 lang_cs.m4 git.m4 refs_cs.m4 refs_en.m4 refs_mono.m4 incl.m4 init.m4 c/queues.m4 c/ref.m4 c/link.m4 c/c.m4 intro.mc
	m4 -DLANG_CODE='cs' $(FLAGS) $^ > $@

generovani-kodu-v-m4-zaklady.c: rootu.m4 countu.m4 config.m4 lang.m4 ver.m4 lang_cs.m4 git.m4 refs_cs.m4 refs_en.m4 refs_mono.m4 incl.m4 init.m4 c/queues.m4 c/ref.m4 c/link.m4 c/c.m4 fundamentals.mc
	m4 -DLANG_CODE='cs' $(FLAGS) $^ > $@

