SOURCE_CODE = \
array.c \
atm.json \
hello.ini \
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

INTACT = \
counter.csv \
hello.csv \

NOTHING = \
insect.txt \
messages.h \
summary.txt \

TARGETS = $(MARKUP_LANG)$(SOURCE_CODE)$(INTACT)$(NOTHING)$(APOSTROPHE)$(DOUBLE_QUOTE)

VPATH = ../gfiles/

.SUFFIXES:
MAKEFLAGS += --no-builtin-rules


#:all	create all targets
.PHONY: all
all: $(TARGETS)

$(MARKUP_LANG): markup.m4

$(SOURCE_CODE): code.m4

$(INTACT): unchanged.m4

$(APOSTROPHE): apost.m4

$(DOUBLE_QUOTE): doubleq.m4

$(NOTHING):

$(TARGETS): messages.mc Makefile

%: rootb.m4 queues.m4 %.m4
	m4 $(filter-out Makefile, $^) > $@


#:cl/clean	remove generated files
.PHONY: clean cl
clean cl:
	$(RM) $(TARGETS)
