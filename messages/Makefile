# __AUTHOR(⟦Josef Kubin⟧, ⟦2019,11,17⟧)
# ___DESCR(⟦the examples show how to generate messages into various target formats requiring modification of special characters⟧)
# __REASON(⟦different target files with specially modified characters for each file⟧)
# ___USAGE(⟦make h && make⟧)

SOURCE_CODE = \
array.c \
atm.json \
hello.ini \
hello_brac.ini \
messages.ini \
messages.json \
qnames.json \
string.c \
stringl.c \

MARKUP_LANG = \
messages.html \
messages.xml \
mixed.xml \

APOSTROPHE = \
apost.sh \

DOUBLE_QUOTE = \
doubleq.sh \

NOTHING = \
insect.txt \
messages.h \
summary.txt \

HEREDOC = \
heredoc.sh \

TARGETS = $(MARKUP_LANG)$(SOURCE_CODE)$(NOTHING)$(APOSTROPHE)$(DOUBLE_QUOTE)$(HEREDOC)

VPATH = ../gfiles/

.SUFFIXES:
MAKEFLAGS += --no-builtin-rules


#:all	create all targets
.PHONY: all
all: hello.csv counter.csv $(TARGETS)

$(MARKUP_LANG): markup.m4 messages.mc Makefile

$(SOURCE_CODE): code.m4 messages.mc Makefile

$(APOSTROPHE): apost.m4 messages.mc Makefile

$(DOUBLE_QUOTE): doubleq.m4 messages.mc Makefile

$(HEREDOC): heredoc.m4 messages.mc Makefile

$(NOTHING): unchanged.m4 messages.mc Makefile

%: root0u.m4 countu.m4 queues.m4 %.m4
	m4 $(filter-out Makefile, $^) > $@

%.csv: root0u.m4 countu.m4 %.csv.m4 messages_raw.mc Makefile
	m4 $(filter-out Makefile, $^) > $@


#:clean/cl	remove generated files
.PHONY: clean cl
clean cl:
	$(RM) $(TARGETS)


#:help/he/hl/h	print this text
.PHONY: help he hl h
help he hl h:
	@sed -n '/^#:/{s//\x1b[7mmake /;s/\t/\x1b[m /;p}' Makefile | sort
