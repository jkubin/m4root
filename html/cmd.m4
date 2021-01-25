__AUTHOR(⟦Josef Kubin⟧, ⟦2020,04,26⟧)
___DESCR(⟦processes the command line with a list of files⟧)
__REASON(⟦generates an appropriate HTML code⟧)

# CMDBARE(⟦⟦cmd⟧, ⟦file.1⟧, ⟦file.2⟧, …, ⟦file.n⟧⟧)
# CMDBARE(⟦⟦cmd -o a,b,c -DMACRO⟧, ⟦file.1,⟦-o x,y,z⟧⟧, ⟦file.2,⟦-DFOO=bar⟧⟧, …, ⟦file.n,⟦2>&1⟧⟧⟧)
# …
# CMDFILE(⟦⟦cmd⟧, ⟦file1.src⟧, ⟦file2.src⟧, …, ⟦file.dst⟧⟧)
# CMDFILE(⟦⟦cmd -o a,b,c -DMACRO⟧, ⟦file1.src,⟦-o x,y,z⟧⟧, ⟦file2.src,⟦-DFOO=bar⟧⟧, …, ⟦file.dst,⟦2>&1⟧⟧⟧)
# …
# Or with attributes:
# CMDBARE(⟦id⟧, ⟦⟦cmd⟧, ⟦file.1⟧, ⟦file.2⟧, …, ⟦file.n⟧⟧)
# CMDBARE(⟦id⟧, ⟦title⟧, ⟦⟦cmd⟧, ⟦file.1⟧, ⟦file.2⟧, …, ⟦file.n⟧⟧)
# CMDBARE(⟦id⟧, ⟦title⟧, ⟦class⟧, ⟦⟦cmd⟧, ⟦file.1⟧, ⟦file.2⟧, …, ⟦file.n⟧⟧)
# CMDBARE(⟦id⟧, ⟦title⟧, ⟦class⟧, ⟦style⟧, ⟦⟦cmd⟧, ⟦file.1⟧, ⟦file.2⟧, …, ⟦file.n⟧⟧)
# CMDBARE(⟦id⟧, ⟦title⟧, ⟦class⟧, ⟦style⟧, ⟦anything⟧, ⟦⟦cmd⟧, ⟦file.1⟧, ⟦file.2⟧, …, ⟦file.n⟧⟧)
# …
# CMDFILE(⟦id⟧, …, ⟦⟦cmd⟧, ⟦input/file1.src⟧, ⟦input/file2.src⟧, …, ⟦output/file.dst⟧⟧)
# …
# Or the root command line:
# CMDBARE_ROOT(⟦⟦cmd⟧, ⟦file.1⟧, ⟦file.2⟧, …, ⟦file.n⟧⟧)
# CMDFILE_ROOT(⟦⟦cmd⟧, ⟦file1.src⟧, ⟦file2.src⟧, …, ⟦file.dst⟧⟧)
# …

# β
pushdef(⟦ID_1_BARE⟧,	⟦ifelse(⟦$#⟧, ⟦1⟧, ⟦NSP()anch-ANCH_COUNTER_val⟧, ⟦$1⟧, ⟦⟧, ⟦NSP()anch-ANCH_COUNTER_val⟧, ⟦ADD_ID_MONO(⟦$1⟧)⟧)⟧)
pushdef(⟦ID_1_FILE⟧,	⟦ifelse(⟦$#⟧, ⟦1⟧, ⟦SARG1(GIT_CSV)⟦-command⟧⟧, ⟦$1⟧, ⟦⟧, ⟦SARG1(GIT_CSV)⟦-command⟧⟧, ⟦ADD_ID_MONO(⟦$1⟧)⟧)⟧)
pushdef(⟦TITLE_2⟧,	⟦⟦⟧ifelse(⟦$#⟧, ⟦2⟧, ⟦⟧, ⟦$2⟧, ⟦⟧, ⟦⟧, ⟦⟦ title="$2"⟧⟧)⟧)
pushdef(⟦CLASS_3_USRC⟧,	⟦ class="ADD_CLASS(⟦cmd usc⟧ifelse(⟦$#⟧, ⟦3⟧, ⟦⟧, ⟦$3⟧, ⟦⟧, ⟦⟧, ⟦⟦ $3⟧⟧))"⟧)
pushdef(⟦CLASS_3_ROOT⟧,	⟦ class="ADD_CLASS(⟦cmd root⟧ifelse(⟦$#⟧, ⟦3⟧, ⟦⟧, ⟦$3⟧, ⟦⟧, ⟦⟧, ⟦⟦ $3⟧⟧))"⟧)
pushdef(⟦STYLE_4⟧,	⟦ifelse(⟦$#⟧, ⟦4⟧, ⟦⟧, ⟦$4⟧, ⟦⟧, ⟦⟧, ⟦⟦ style="$4"⟧⟧)⟧)
pushdef(⟦ANYTHING_5⟧,	⟦ifelse(⟦$#⟧, ⟦5⟧, ⟦⟧, ⟦$5⟧, ⟦⟧, ⟦⟧, ⟦⟦ $5⟧⟧)⟧)

# A → β
define(⟦CMDFILE⟧, ⟦

	# create HTML skeleton
	divert(CURRQU)dnl
<div id="divert(AUXILIARY_1_QUEUE)"⟧defn(⟦CLASS_3_USRC⟧)⟦><pre⟧defn(⟦TITLE_2⟧, ⟦STYLE_4⟧, ⟦ANYTHING_5⟧)⟦>dnl
divert(AUXILIARY_2_QUEUE)dnl
</pre><code><span class="ADD_CLASS(⟦cb⟧)" title="defn(⟦WORD_CLIPBOARD⟧)"></span><a href="⟦#⟧divert(AUXILIARY_3_QUEUE)" title="⚓"></a></code></div>
divert(-1)

	COMMAND_WITH_INPUT_FILES_AND_OUTPUT_FILE(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦)

	# finish the resulting HTML code
	divert(CURRQU)dnl
⟧defn(⟦ID_1_FILE⟧)⟦dnl
undivert(AUXILIARY_1_QUEUE, AUXILIARY_2_QUEUE)dnl
⟧defn(⟦ID_1_FILE⟧)⟦dnl
undivert(AUXILIARY_3_QUEUE)dnl
divert(-1)
⟧)

# A → β
define(⟦CMDFILE_ROOT⟧, ⟦

	# create HTML skeleton
	divert(CURRQU)dnl
<div id="divert(AUXILIARY_1_QUEUE)"⟧defn(⟦CLASS_3_ROOT⟧)⟦><pre⟧defn(⟦TITLE_2⟧, ⟦STYLE_4⟧, ⟦ANYTHING_5⟧)⟦>dnl
divert(AUXILIARY_2_QUEUE)dnl
</pre><code><span class="ADD_CLASS(⟦cb⟧)" title="defn(⟦WORD_CLIPBOARD⟧)"></span><a href="⟦#⟧divert(AUXILIARY_3_QUEUE)" title="⚓"></a></code></div>
divert(-1)

	COMMAND_WITH_INPUT_FILES_AND_OUTPUT_FILE(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦)

	# finish the resulting HTML code
	divert(CURRQU)dnl
⟧defn(⟦ID_1_FILE⟧)⟦dnl
undivert(AUXILIARY_1_QUEUE, AUXILIARY_2_QUEUE)dnl
⟧defn(⟦ID_1_FILE⟧)⟦dnl
undivert(AUXILIARY_3_QUEUE)dnl
divert(-1)
⟧)

# A → β
define(⟦COMMAND_WITH_INPUT_FILES_AND_OUTPUT_FILE⟧, ⟦

	ifelse(eval(⟦$# > 2⟧), ⟦1⟧, ⟦⟧, ⟦

		ROOT_ERROR(⟦the command ‘$1’ requires at least 2 files (input and output): ‘$@’⟧)
	⟧)

	divert(AUXILIARY_1_QUEUE)dnl
$1 dnl print the first item (a command)
divert(-1)

	INPUT_FILES_AND_OUTPUT_FILE(shift($@))
⟧)

# A → β
define(⟦INPUT_FILES_AND_OUTPUT_FILE⟧, ⟦

	# set the git csv record for the file from the associative memory
	define(⟦GIT_CSV⟧, defn(⟦./⟧SARG1($1)))

	ifelse(defn(⟦GIT_CSV⟧), ⟦⟧, ⟦

		ROOT_ERROR(⟦the file record for the key ‘./$1’ not found, run the command: make db⟧)
	⟧)

	divert(AUXILIARY_1_QUEUE)dnl
ifelse(⟦$#⟧, ⟦1⟧, ⟦> ⟧)<a href="SRC_FILE_PATH(SARG1($1))" title="SARG1($1)
date: SARG4(GIT_CSV)
git rev: SARG3(GIT_CSV)
sha1sum: SARG5(GIT_CSV)
size: SARG6(GIT_CSV) B">patsubst(SARG1($1), ⟦.*/⟧)</a>ifelse(SARG2($1), ⟦⟧, ⟦⟧, ⟦ ARG2($1)⟧)⟦⟧ifelse(⟦$#⟧, ⟦1⟧, ⟦⟧, ⟦ ⟧)⟦⟧dnl
divert(-1)

	ifelse(⟦$#⟧, ⟦1⟧, ⟦⟧, ⟦

		# right recursive loop
		$0(shift($@))
	⟧)
⟧)

# A → β
define(⟦CMDBARE⟧, ⟦

	# increment the default anchor number
	ANCH_COUNTER

	divert(CURRQU)dnl
<div id="⟧defn(⟦ID_1_BARE⟧)⟦"⟧defn(⟦CLASS_3_USRC⟧)⟦><pre⟧defn(⟦TITLE_2⟧, ⟦STYLE_4⟧, ⟦ANYTHING_5⟧)⟦>dnl
divert(-1)

	COMMAND_AND_VARIOUS_FILES(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦)

	divert(CURRQU)dnl
</pre><code><span class="ADD_CLASS(⟦cb⟧)" title="defn(⟦WORD_CLIPBOARD⟧)"></span><a href="⟦#⟧⟧defn(⟦ID_1_BARE⟧)⟦" title="⚓"></a></code></div>
divert(-1)
⟧)

# A → β
define(⟦CMDBARE_ROOT⟧, ⟦

	# increment the default anchor number
	ANCH_COUNTER

	divert(CURRQU)dnl
<div id="⟧defn(⟦ID_1_BARE⟧)⟦"⟧defn(⟦CLASS_3_ROOT⟧)⟦><pre⟧defn(⟦TITLE_2⟧, ⟦STYLE_4⟧, ⟦ANYTHING_5⟧)⟦>dnl
divert(-1)

	COMMAND_AND_VARIOUS_FILES(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦)

	divert(CURRQU)dnl
</pre><code><span class="ADD_CLASS(⟦cb⟧)" title="defn(⟦WORD_CLIPBOARD⟧)"></span><a href="⟦#⟧⟧defn(⟦ID_1_BARE⟧)⟦" title="⚓"></a></code></div>
divert(-1)
⟧)

# A → β
define(⟦COMMAND_AND_VARIOUS_FILES⟧, ⟦

	ifelse(eval(⟦$# > 1⟧), ⟦1⟧, ⟦⟧, ⟦

		ROOT_ERROR(⟦the command ‘$1’ requires at least 1 file⟧)
	⟧)

	divert(CURRQU)dnl
$1 dnl print the first item (a command)
divert(-1)

	VARIOUS_FILES_AFTER_COMMAND(shift($@))
⟧)

# A → β
define(⟦VARIOUS_FILES_AFTER_COMMAND⟧, ⟦

	# set the file csv record from the associative memory
	define(⟦GIT_CSV⟧, defn(⟦./⟧SARG1($1)))

	ifelse(defn(⟦GIT_CSV⟧), ⟦⟧, ⟦

		ROOT_ERROR(⟦the file record for the key ‘./$1’ not found, run the command: make db⟧)
	⟧)

	divert(CURRQU)dnl
<a href="SRC_FILE_PATH(SARG1($1))" title="SARG1($1)
date: SARG4(GIT_CSV)
git rev: SARG3(GIT_CSV)
sha1sum: SARG5(GIT_CSV)
size: SARG6(GIT_CSV) B">patsubst(SARG1($1), ⟦.*/⟧)</a>ifelse(SARG2($1), ⟦⟧, ⟦⟧, ⟦ ARG2($1)⟧)⟦⟧ifelse(⟦$#⟧, ⟦1⟧, ⟦⟧, ⟦ ⟧)⟦⟧dnl
divert(-1)

	ifelse(⟦$#⟧, ⟦1⟧, ⟦⟧, ⟦

		# right recursive loop
		$0(shift($@))
	⟧)
⟧)

# forget local β rules (good for frozen files)
popdef(

		⟦ANYTHING_5⟧,
		⟦CLASS_3⟧,
		⟦ID_1_BARE⟧,
		⟦ID_1_FILE⟧,
		⟦STYLE_4⟧,
		⟦TITLE_2⟧,
		⟦__CMDBARE⟧,
		⟦__CMDFILE⟧,

)
