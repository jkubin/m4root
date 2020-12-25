# __HEADER([Josef Kubin], [2019/11/17], [root_cz])
# ___DESCR([the examples show how to generate messages into various target formats requiring modification of special characters])
# __REASON([different target files with specially modified characters for each file])
# ___USAGE([make h && make])

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

TARGETS = $(MARKUP_LANG)$(SOURCE_CODE)$(NOTHING)$(APOSTROPHE)$(DOUBLE_QUOTE)

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

$(NOTHING): messages.mc Makefile

%: root0b.m4 countb.m4 queues.m4 %.m4
	m4 $(filter-out Makefile, $^) > $@

%.csv: root0b.m4 countb.m4 %.csv.m4 messages_raw.mc Makefile
	m4 $(filter-out Makefile, $^) > $@


#:clean/cl	remove generated files
.PHONY: clean cl
clean cl:
	$(RM) $(TARGETS)


#:help/he/hl/h	print this text
.PHONY: help he hl h
help he hl h:
	@sed -n '/^#:/{s//\x1b[7mmake /;s/\t/\x1b[m /;p}' Makefile | sort	# ]]	<--- square brackets because of M4
