# vim:ft=m4

__HEADER(⟦Josef Kubin⟧, ⟦2019/09/01⟧, ⟦root_cz⟧)
___DESCR(⟦the script generates additional rules extending the handwritten Makefile to generate HTML files⟧)
__REASON(⟦additional rules by configuration from command line to generate HTML files⟧)

# A → β
define(⟦MAKE_RULE⟧, ⟦

	ifelse(⟦$1⟧, ⟦⟧, ⟦⟧, ⟦

		# find the folder name from the associative memory
		define(⟦TARGET_FOLDER⟧, defn(⟦$1⟧.LANG_CODE.anch))

		ifelse(defn(⟦TARGET_FOLDER⟧), ⟦⟧, ⟦

			ROOT_ERROR(⟦‘$1.⟧LANG_CODE⟦.anch’ is not defined⟧)
		⟧)

		divert(1)dnl
defn(⟦TARGET_FOLDER⟧) \
divert(3)dnl
TARGET_FOLDER/%.html: JAVASCRIPT rootu.m4 html/queues.m4 html/ent.m4 cfg.m4 init.m4 html/inline.m4 headings.m4 html/block.m4 ver.m4 html/style.m4 lang_⟦⟧LANG_CODE.m4 html/css.m4 js.m4 git.m4 REFS_FILES lang.m4 incl.m4 html/file.m4 html/cmd.m4 html/%.m4 $1 html/nav.m4
	m4 -DLANG_CODE='LANG_CODE' -DARTICLE_PATH='TARGET_FOLDER' -DFILE_LIST='FILE_LIST' -DOUTPUT_FILE='$⟦*⟧.html' $(FLAGS) $(filter-out JAVASCRIPT, $^) | sed -f html/esc_to_ent.sed > $⟦@⟧
	tidy -qe --drop-empty-elements no $⟦@⟧

TARGET_FOLDER/spell.txt: rootu.m4 cfg.m4 lang.m4 headings.m4 ver.m4 lang_⟦⟧LANG_CODE.m4 REFS_FILES incl.m4 spell.m4 $1
	m4 -DLANG_CODE='LANG_CODE' $(FLAGS) $^ > $⟦@⟧

TARGET_FOLDER/publish.txt: JAVASCRIPT rootu.m4 html/queues.m4 html/ent.m4 cfg.m4 init.m4 html/inline.m4 headings.m4 html/block.m4 ver.m4 html/style.m4 lang_⟦⟧LANG_CODE.m4 html/css.m4 js.m4 git.m4 git_mc.m4 git_⟦⟧LANG_CODE.m4 REFS_FILES lang.m4 incl.m4 html/file.m4 html/cmd.m4 html/publish.m4 $1 html/nav.m4
	m4 -DLANG_CODE='LANG_CODE' -DARTICLE_PATH='TARGET_FOLDER' --define='./$⟦@⟧'='⟦⟦master⟧⟧' -DFILE_LIST='FILE_LIST' $(FLAGS) $(filter-out JAVASCRIPT, $^) | sed -f html/publish.sed -f html/esc_to_ent.sed > $⟦@⟧
	git add $⟦@⟧
	git ci -m 'generated file'

divert(-1)

		# right recursive loop
		$0(shift($@))
	⟧)
⟧)

MAKE_RULE(FILE_LIST)

# define Makefile names
# A → β
define(⟦ALL_SUBTARGETS⟧,	⟦all_⟧LANG_CODE ⟦a⟧LANG_CODE LANG_CODE)
define(⟦CLEAN_SUBTARGETS⟧,	⟦clean_⟧LANG_CODE ⟦cl_⟧LANG_CODE ⟦cl⟧LANG_CODE ⟦c⟧LANG_CODE)
define(⟦PUBLISH_FILES⟧,		⟦PUBLISH_⟧LANG_CODE)
define(⟦PREVIEW_FILES⟧,		⟦PREVIEW_⟧LANG_CODE)
define(⟦SPCHECK_FILES⟧,		⟦SPCHECK_⟧LANG_CODE)
define(⟦ARTICLE_FILES⟧,		⟦ARTICLE_⟧LANG_CODE)
define(⟦FOLDER_NAMES⟧,		⟦FOLDERS_⟧LANG_CODE)
define(⟦SUBTARGETS⟧,		$(FOLDER_NAMES) $(SPCHECK_FILES) $(PREVIEW_FILES) $(ARTICLE_FILES))

# generate the final output
divert(0)dnl
⟦#⟧ DONTE()

FOLDER_NAMES = \
divert(2)
ARTICLE_FILES = $(FOLDER_NAMES:=/index.html)
PREVIEW_FILES = $(FOLDER_NAMES:=/preview.html)
PUBLISH_FILES = $(FOLDER_NAMES:=/publish.txt)
SPCHECK_FILES = $(FOLDER_NAMES:=/spell.txt)
ARTICLE  += $(FOLDER_NAMES) $(ARTICLE_FILES)
FOLDERS  += $(FOLDER_NAMES)
PREVIEW  += $(FOLDER_NAMES) $(PREVIEW_FILES)
PUBLISH  += $(FOLDER_NAMES) $(PUBLISH_FILES)
SPCHECK  += $(FOLDER_NAMES) $(SPCHECK_FILES)
TARGETS  += SUBTARGETS

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

#:article/art/a	generates an article (this is a target for routine article development)
.PHONY: article art a
article art a: $(ARTICLE)

⟦#⟧:patsubst(defn(⟦ALL_SUBTARGETS⟧), ⟦ ⟧, ⟦/⟧)	generates ‘LANG_CODE’ files
.PHONY: ALL_SUBTARGETS
ALL_SUBTARGETS: SUBTARGETS

⟦#⟧:patsubst(defn(⟦CLEAN_SUBTARGETS⟧), ⟦ ⟧, ⟦/⟧)	deletes ‘LANG_CODE’ files
.PHONY: CLEAN_SUBTARGETS
CLEAN_SUBTARGETS:
	$(RM) -r $(FOLDER_NAMES)

git_⟦⟧LANG_CODE.m4: $(SPCHECK_FILES) $(PREVIEW_FILES) $(ARTICLE_FILES)

⟦#⟧:fhtml	is disabled for ‘LANG_CODE’
fhtml_⟦⟧LANG_CODE.mk: ;

$(FOLDER_NAMES):
	mkdir -p $@

