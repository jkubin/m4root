# vim:ft=m4

__AUTHOR(⟦Josef Kubin⟧, ⟦2020,01,05⟧)
___DESCR(⟦the script generates experimental additional rules extending the handwritten Makefile to generate HTML files⟧)
__REASON(⟦additional rules by configuration from command line; the rules utilise M4 frozen files to generate HTML files⟧)

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
TARGET_FOLDER/%.html: html_⟦⟧LANG_CODE.m4f $(JAVASCRIPT) %.m4 $1 nav.m4
	m4 -DOUTPUT_FILE='$⟦@⟧' -DARTICLE_PATH='TARGET_FOLDER' $(FLAGS) -R $(filter-out $(JAVASCRIPT), $^) | sed -f html/esc_to_ent.sed > $⟦@⟧
	tidy -qe --drop-empty-elements no $⟦@⟧

TARGET_FOLDER/publish.txt: html_⟦⟧LANG_CODE.m4f git_mc.m4 git_⟦⟧LANG_CODE.m4 $(JAVASCRIPT) publish.m4 $1 nav.m4
	m4 -DARTICLE_PATH='TARGET_FOLDER' $(FLAGS) -R $(filter-out $(JAVASCRIPT), $^) | sed -f html/publish.sed -f html/esc_to_ent.sed > $⟦@⟧

TARGET_FOLDER/spell.txt: rootu.m4 aux.m4 lang.m4 headings.m4 ver.m4 lang_⟦⟧LANG_CODE.m4 REFS_FILES incl.m4 spell.m4 $1
	m4 -DLANG_CODE='LANG_CODE' $^ > $⟦@⟧

divert(-1)

		# right recursive loop
		$0(shift($@))
	⟧)
⟧)

# process table from the common content file
TABLE_OF_CONTENT(LANG_CODE)

# define Makefile names
# A → β
define(⟦ALL_SUBTARGETS⟧,	⟦all-⟧LANG_CODE ⟦a⟧LANG_CODE LANG_CODE)
define(⟦CLEAN_SUBTARGETS⟧,	⟦clean-⟧LANG_CODE ⟦cl-⟧LANG_CODE ⟦cl⟧LANG_CODE ⟦c⟧LANG_CODE)
define(⟦PUBLISH_FILES⟧,		⟦PUBLISH_⟧LANG_CODE)
define(⟦PREVIEW_FILES⟧,		⟦PREVIEW_⟧LANG_CODE)
define(⟦SPCHECK_FILES⟧,		⟦SPCHECK_⟧LANG_CODE)
define(⟦ARTICLE_FILES⟧,		⟦ARTICLE_⟧LANG_CODE)
define(⟦FOLDER_NAMES⟧,		⟦FOLDERS_⟧LANG_CODE)
define(⟦FROZEN_FILE⟧,		⟦html_⟧LANG_CODE.m4f)
define(⟦SUBTARGETS⟧,		$(FOLDER_NAMES) $(SPCHECK_FILES) $(PREVIEW_FILES) $(ARTICLE_FILES) $(PUBLISH_FILES))

# generate the final output
divert(0)dnl
⟦#⟧ DONTE()

VPATH += html

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

#:html/article/art/a	generates an article (for development)
.PHONY: html article art a
html article art a: $(ARTICLE)

⟦#⟧:patsubst(defn(⟦ALL_SUBTARGETS⟧), ⟦ ⟧, ⟦/⟧)	generates ‘LANG_CODE’ files
.PHONY: ALL_SUBTARGETS
ALL_SUBTARGETS: SUBTARGETS

⟦#⟧:patsubst(defn(⟦CLEAN_SUBTARGETS⟧), ⟦ ⟧, ⟦/⟧)	deletes ‘LANG_CODE’ files
.PHONY: CLEAN_SUBTARGETS
CLEAN_SUBTARGETS:
	$(RM) -r $(FOLDER_NAMES) FROZEN_FILE

⟦#⟧:html	is disabled for ‘LANG_CODE’
html_⟦⟧LANG_CODE.mk: ;

$(FOLDER_NAMES):
	mkdir -p $@

git_⟦⟧LANG_CODE.m4: $(SPCHECK_FILES) $(PREVIEW_FILES) $(ARTICLE_FILES)

FROZEN_FILE: JAVASCRIPT rootu.m4 queues.m4 config.m4 ent.m4 init.m4 inline.m4 headings.m4 block.m4 ver.m4 style.m4 lang_⟦⟧LANG_CODE.m4 css.m4 js.m4 git.m4 REFS_FILES lang.m4 incl.m4 file.m4 cmd.m4
	m4 -F $@ -DLANG_CODE='LANG_CODE' -DFILE_LIST='FILE_LIST' $(filter-out JAVASCRIPT, $^)

