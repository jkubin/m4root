# vim:ft=m4

__AUTHOR(⟦Josef Kubin⟧, ⟦2019,09,01⟧)
___DESCR(⟦the script generates additional rules extending the handwritten Makefile to generate HTML files⟧)
__REASON(⟦additional rules by configuration from command line to generate HTML files⟧)

# A → β
define(⟦MAKE_RULE⟧, ⟦

	ifelse(⟦$1⟧, ⟦⟧, ⟦⟧, ⟦

		# find the folder name from the associative memory
		define(⟦FILE_STEM⟧, defn(⟦$1⟧.LANG_CODE.anch))

		ifelse(defn(⟦FILE_STEM⟧), ⟦⟧, ⟦

			ROOT_ERROR(⟦‘$1.⟧LANG_CODE⟦.anch’ is not defined⟧)
		⟧)

		divert(1)dnl
defn(⟦FILE_STEM⟧) \
divert(3)dnl
FILE_STEM/%.html: JAVASCRIPT rootu.m4 countu.m4 html/queues.m4 html/ent.m4 config.m4 init.m4 html/inline.m4 html/block.m4 ver.m4 html/style.m4 lang_⟦⟧LANG_CODE.m4 html/css.m4 js.m4 git.m4 REFS_FILES lang.m4 incl.m4 html/file.m4 html/cmd.m4 html/%.m4 $1 html/nav.m4
	m4 -DLANG_CODE='LANG_CODE' -DARTICLE_PATH='FILE_STEM' -DFILE_LIST='FILE_LIST' -DOUTPUT_FILE='$⟦*⟧.html' $(FLAGS) $(filter-out JAVASCRIPT, $^) | sed -f html/esc_to_ent.sed > $⟦@⟧
	tidy -qe --drop-empty-elements no $⟦@⟧

FILE_STEM/spell.txt: rootu.m4 countu.m4 config.m4 lang.m4 ver.m4 lang_⟦⟧LANG_CODE.m4 REFS_FILES incl.m4 spell.m4 $1
	m4 -DLANG_CODE='LANG_CODE' $(FLAGS) $^ > $⟦@⟧

FILE_STEM/publish.txt: JAVASCRIPT rootu.m4 countu.m4 html/queues.m4 html/ent.m4 config.m4 init.m4 html/inline.m4 html/block.m4 ver.m4 html/style.m4 lang_⟦⟧LANG_CODE.m4 html/css.m4 js.m4 git.m4 git_mc.m4 git_⟦⟧LANG_CODE.m4 REFS_FILES lang.m4 incl.m4 html/file.m4 html/cmd.m4 html/publish.m4 $1 html/nav.m4
	m4 -DLANG_CODE='LANG_CODE' -DARTICLE_PATH='FILE_STEM' --define='./$⟦@⟧'='master' -DFILE_LIST='FILE_LIST' $(FLAGS) $(filter-out JAVASCRIPT, $^) | sed -f html/publish.sed -f html/esc_to_ent.sed > $⟦@⟧
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
define(⟦ALL_SUBTARGETS⟧,	⟦all-⟧LANG_CODE ⟦a⟧LANG_CODE LANG_CODE)
define(⟦CLEAN_SUBTARGETS⟧,	⟦clean-⟧LANG_CODE ⟦cl-⟧LANG_CODE ⟦cl⟧LANG_CODE ⟦c⟧LANG_CODE)
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

#:html/article/art/a	generates an article (for development)
.PHONY: html article art a
html article art a: $(ARTICLE)

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

