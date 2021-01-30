__AUTHOR(⟦Josef Kubin⟧, ⟦2020,04,26⟧)
___DESCR(⟦processes the command line with a list of files⟧)
__REASON(⟦converts command line to HTML code⟧)

# CMDFILES(⟦⟦cmd⟧⟧)
# CMDFILES(⟦⟦cmd⟧, ⟦file.1⟧, ⟦file.2⟧, …, ⟦file.n⟧⟧)
# CMDFILES(⟦⟦cmd⟧, ⟦file.1⟧, ⟦file.2⟧, …, ⟦file.n,⟦GT()⟧⟧, ⟦file.dst,⟦2GT()AMP()1⟧⟧⟧)
#
# the following macros generate the same code (however they are not the same)
# CMDFILES(⟦⟦cmd -p a⟦,⟧b⟦,⟧c -DMACRO⟧, ⟦file.1,⟦-w x,y,z⟧⟧, ⟦file.2,⟦-DFOO=bar⟧⟧, …, ⟦file.n,⟦2GT()AMP()1⟧⟧⟧)
# CMDFILES(⟦⟦cmd ⟦-p a,b,c -DMACRO⟧⟧, ⟦file.1,⟦-w x,y,z⟧⟧, ⟦file.2,⟦-DFOO=bar⟧⟧, …, ⟦file.n,⟦2GT()AMP()1⟧⟧⟧)
# CMDFILES(⟦⟦⟦cmd -p a,b,c -DMACRO⟧⟧, ⟦file.1,⟦-w x,y,z⟧⟧, ⟦file.2,⟦-DFOO=bar⟧⟧, …, ⟦file.n,⟦2GT()AMP()1⟧⟧⟧)
# CMDFILES(⟦⟦cmd,⟦-p a,b,c -DMACRO⟧⟧, ⟦file.1,⟦-w x,y,z⟧⟧, ⟦file.2,⟦-DFOO=bar⟧⟧, …, ⟦file.n,⟦2GT()AMP()1⟧⟧⟧)
# …
# with HTML attributes:
# CMDFILES(⟦id⟧, ⟦⟦cmd⟧, ⟦file.1⟧, ⟦file.2⟧, …, ⟦file.n⟧⟧)
# CMDFILES(⟦id⟧, ⟦title⟧, ⟦⟦cmd⟧, ⟦file.1⟧, ⟦file.2⟧, …, ⟦file.n⟧⟧)
# CMDFILES(⟦id⟧, ⟦title⟧, ⟦class⟧, ⟦⟦cmd⟧, ⟦file.1⟧, ⟦file.2⟧, …, ⟦file.n⟧⟧)
# CMDFILES(⟦id⟧, ⟦title⟧, ⟦class⟧, ⟦style⟧, ⟦⟦cmd⟧, ⟦file.1⟧, ⟦file.2⟧, …, ⟦file.n⟧⟧)
# CMDFILES(⟦id⟧, ⟦title⟧, ⟦class⟧, ⟦style⟧, ⟦anything⟧, ⟦⟦cmd⟧, ⟦file.1⟧, ⟦file.2⟧, …, ⟦file.n⟧⟧)
# …
# the root command line:
# CMDFILES_ROOT(⟦⟦cmd⟧, ⟦file.1⟧, ⟦file.2⟧, …, ⟦file.n⟧⟧)
# …

# β
pushdef(⟦ID_1_FILE⟧,	⟦ifelse(⟦$#⟧, ⟦1⟧, ⟦SARG1(GIT_CSV)⟦-command⟧⟧, ⟦$1⟧, ⟦⟧, ⟦SARG1(GIT_CSV)⟦-command⟧⟧, ⟦ADD_ID_MONO(⟦$1⟧)⟧)⟧)
pushdef(⟦TITLE_2⟧,	⟦⟦⟧ifelse(⟦$#⟧, ⟦2⟧, ⟦⟧, ⟦$2⟧, ⟦⟧, ⟦⟧, ⟦⟦ title="$2"⟧⟧)⟧)
pushdef(⟦CLASS_3_USRC⟧,	⟦ class="ADD_CLASS(⟦cmd usc⟧ifelse(⟦$#⟧, ⟦3⟧, ⟦⟧, ⟦$3⟧, ⟦⟧, ⟦⟧, ⟦⟦ $3⟧⟧))"⟧)
pushdef(⟦CLASS_3_ROOT⟧,	⟦ class="ADD_CLASS(⟦cmd root⟧ifelse(⟦$#⟧, ⟦3⟧, ⟦⟧, ⟦$3⟧, ⟦⟧, ⟦⟧, ⟦⟦ $3⟧⟧))"⟧)
pushdef(⟦STYLE_4⟧,	⟦ifelse(⟦$#⟧, ⟦4⟧, ⟦⟧, ⟦$4⟧, ⟦⟧, ⟦⟧, ⟦⟦ style="$4"⟧⟧)⟧)
pushdef(⟦ANYTHING_5⟧,	⟦ifelse(⟦$#⟧, ⟦5⟧, ⟦⟧, ⟦$5⟧, ⟦⟧, ⟦⟧, ⟦⟦ $5⟧⟧)⟧)

# A → β
define(⟦CMDFILES⟧, ⟦

	COMMAND_WITH_LIST_OF_FILES(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦)

	# completes the resulting HTML code from previously prepared pieces of code
	divert(CURRQU)dnl
<div id="⟧defn(⟦ID_1_FILE⟧)⟦"⟧defn(⟦CLASS_3_USRC⟧)⟦><pre⟧defn(⟦TITLE_2⟧, ⟦STYLE_4⟧, ⟦ANYTHING_5⟧)⟦>dnl
undivert(AUXILIARY_1_QUEUE)dnl
</pre><code><span class="ADD_CLASS(⟦cb⟧)" title="defn(⟦WORD_CLIPBOARD⟧)"></span><a href="⟦#⟧⟧defn(⟦ID_1_FILE⟧)⟦" title="⚓"></a></code></div>
divert(-1)
⟧)

# A → β
define(⟦CMDFILES_ROOT⟧, ⟦

	COMMAND_WITH_LIST_OF_FILES(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦)

	# completes the resulting HTML code from previously prepared pieces of code
	divert(CURRQU)dnl
<div id="⟧defn(⟦ID_1_FILE⟧)⟦"⟧defn(⟦CLASS_3_ROOT⟧)⟦><pre⟧defn(⟦TITLE_2⟧, ⟦STYLE_4⟧, ⟦ANYTHING_5⟧)⟦>dnl
undivert(AUXILIARY_1_QUEUE)dnl
</pre><code><span class="ADD_CLASS(⟦cb⟧)" title="defn(⟦WORD_CLIPBOARD⟧)"></span><a href="⟦#⟧⟧defn(⟦ID_1_FILE⟧)⟦" title="⚓"></a></code></div>
divert(-1)
⟧)

# A → β
define(⟦COMMAND_WITH_LIST_OF_FILES⟧, ⟦

	# prints the command plus attribute
	divert(AUXILIARY_1_QUEUE)dnl
ARG1($1)⟦⟧ifelse(SARG2($1), ⟦⟧, ⟦⟧, ⟦ ARG2($1)⟧)⟦⟧dnl print the first item (a command)
divert(-1)

	ifelse(⟦$#⟧, ⟦1⟧, ⟦

		# if no list of files, increase the anchor number for later use
		ANCH_COUNTER

		define(⟦GIT_CSV⟧, NSP()anch-ANCH_COUNTER_val)
	⟧, ⟦

		LIST_OF_FILES_AFTER_COMMAND(shift($@))
	⟧)
⟧)

# A → β
define(⟦LIST_OF_FILES_AFTER_COMMAND⟧, ⟦

	# set the git csv record for the file from the associative memory
	define(⟦GIT_CSV⟧, defn(⟦./⟧SARG1($1)))

	ifelse(defn(⟦GIT_CSV⟧), ⟦⟧, ⟦

		ROOT_ERROR(⟦the file record for the key ‘./⟧SARG1($1)⟦’ not found, run the command: make db⟧)
	⟧)

	# lists files with possible attributes
	divert(AUXILIARY_1_QUEUE)dnl
 <a href="SRC_FILE_PATH(SARG1($1))" title="SARG1($1)
date: SARG4(GIT_CSV)
git rev: SARG3(GIT_CSV)
sha1sum: SARG5(GIT_CSV)
size: SARG6(GIT_CSV) B">patsubst(SARG1($1), ⟦.*/⟧)</a>ifelse(SARG2($1), ⟦⟧, ⟦⟧, ⟦ ARG2($1)⟧)⟦⟧dnl
divert(-1)

	ifelse(⟦$#⟧, ⟦1⟧, ⟦⟧, ⟦

		# right recursive loop
		$0(shift($@))
	⟧)
⟧)

ifelse(⟦
# obsolete
pushdef(⟦ID_1_ANCH⟧,	⟦ifelse(⟦$#⟧, ⟦1⟧, ⟦NSP()anch-ANCH_COUNTER_val⟧, ⟦$1⟧, ⟦⟧, ⟦NSP()anch-ANCH_COUNTER_val⟧, ⟦ADD_ID_MONO(⟦$1⟧)⟧)⟧)
# A → β
define(⟦CMDANCH⟧, ⟦

	# increment the anchor number
	ANCH_COUNTER

	divert(CURRQU)dnl
<div id="⟧defn(⟦ID_1_ANCH⟧)⟦"⟧defn(⟦CLASS_3_USRC⟧)⟦><pre⟧defn(⟦TITLE_2⟧, ⟦STYLE_4⟧, ⟦ANYTHING_5⟧)⟦>dnl
divert(-1)

	COMMAND_WITH_LIST_OF_FILES(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦)

	divert(CURRQU)dnl
</pre><code><span class="ADD_CLASS(⟦cb⟧)" title="defn(⟦WORD_CLIPBOARD⟧)"></span><a href="⟦#⟧⟧defn(⟦ID_1_ANCH⟧)⟦" title="⚓"></a></code></div>
divert(-1)
⟧)

# A → β
define(⟦CMDANCH_ROOT⟧, ⟦

	# increment the anchor number
	ANCH_COUNTER

	divert(CURRQU)dnl
<div id="⟧defn(⟦ID_1_ANCH⟧)⟦"⟧defn(⟦CLASS_3_ROOT⟧)⟦><pre⟧defn(⟦TITLE_2⟧, ⟦STYLE_4⟧, ⟦ANYTHING_5⟧)⟦>dnl
divert(-1)

	COMMAND_WITH_LIST_OF_FILES(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦)

	divert(CURRQU)dnl
</pre><code><span class="ADD_CLASS(⟦cb⟧)" title="defn(⟦WORD_CLIPBOARD⟧)"></span><a href="⟦#⟧⟧defn(⟦ID_1_ANCH⟧)⟦" title="⚓"></a></code></div>
divert(-1)
⟧)

# A → β
define(⟦COMMAND_WITH_LIST_OF_FILES⟧, ⟦

	divert(CURRQU)dnl
ARG1($1)⟦⟧ifelse(SARG2($1), ⟦⟧, ⟦⟧, ⟦ ARG2($1)⟧)⟦⟧dnl print the first item (a command)
divert(-1)

	ifelse(⟦$#⟧, ⟦1⟧, ⟦⟧, ⟦

		LIST_OF_FILES_AFTER_COMMAND(shift($@))
	⟧)
⟧)

popdef(

	⟦ID_1_ANCH⟧,

)

⟧)dnl comment

# forget local β rules (good for frozen files)
popdef(

	⟦ANYTHING_5⟧,
	⟦CLASS_3⟧,
	⟦ID_1_FILE⟧,
	⟦STYLE_4⟧,
	⟦TITLE_2⟧,
	⟦__CMDBARE⟧,
	⟦__CMDFILE⟧,

)
