__AUTHOR(⟦Josef Kubin⟧, ⟦2020,04,26⟧)
___DESCR(⟦command line with a list of input files, the last file is an output file⟧)
__REASON(⟦generates HTML code from the command line⟧)

# β
pushdef(⟦#$EXECUTED⟧, ⟦

	ifelse(eval(⟦$# > 1⟧), ⟦1⟧, ⟦⟧, ⟦

		ROOT_ERROR(⟦‘$0($@)’ requires at least 2 arguments⟧)
	⟧)

	divert(COMMAND_ARGS_QUEUE)dnl
$1 dnl
divert(-1)

	FILES_ON_THE_COMMAND_LINE(shift($@))
⟧)

# EXECUTED(⟦foo -o a,b,c -DMACRO⟧, ⟦input/file1.src⟧, ⟦input/file2.src⟧, ⟦input/file3.src⟧, …, ⟦output/file.dst⟧)
# EXECUTED(⟦foo -o a,b,c -DMACRO⟧, ⟦input/file1.src,⟦-o x,y,z⟧⟧, ⟦input/file2.src⟧, …, ⟦output/file.dst⟧)
# A → β
define(⟦EXECUTED⟧, ⟦

	define(⟦COMMAND_LINE_CLASS⟧, ⟦usc⟧)

⟧defn(⟦#$EXECUTED⟧))

# EXECUTED_ROOT(…)
# A → β
define(⟦EXECUTED_ROOT⟧, ⟦

	define(⟦COMMAND_LINE_CLASS⟧, ⟦root⟧)

⟧defn(⟦#$EXECUTED⟧))

# A → β
define(⟦FILES_ON_THE_COMMAND_LINE⟧, ⟦

	# git record from an associative array
	define(⟦GIT_CSV⟧, defn(⟦./⟧SARG1($1)))

	ifelse(defn(⟦GIT_CSV⟧), ⟦⟧, ⟦

		ROOT_ERROR(⟦git record for the key ‘./$1’ not found, regenerate git database⟧)
	⟧)

	ifelse(⟦$#⟧, ⟦1⟧, ⟦

		# set id from an associative array
		define(⟦#ID⟧, defn(__file__.mono.SARG1($1)))

		ifelse(defn(⟦#ID⟧), ⟦⟧, ⟦

			ROOT_ERROR(⟦id record for the key ‘⟧__file__⟦.mono.⟧SARG1($1)⟦’ not found, regenerate file references⟧)
		⟧)

		divert(CURRQU)dnl
<div id="ADD_ID_RULE(defn(⟦#ID⟧)-command)" class="ADD_CLASS(⟦cmd⟧) ADD_CLASS(defn(⟦COMMAND_LINE_CLASS⟧))"><pre title="defn(⟦WORD_COMMAND⟧)">dnl
undivert(COMMAND_ARGS_QUEUE)dnl
> <a href="SRC_FILE_PATH(SARG1($1))" title="SARG1($1)
date: SARG3(GIT_CSV)
git rev: SARG2(GIT_CSV)
sha1sum: SARG4(GIT_CSV)
size: SARG5(GIT_CSV) B">patsubst(SARG1($1), ⟦.*/⟧)</a></pre><code><span class="ADD_CLASS(⟦cb⟧)" title="defn(⟦WORD_CLIPBOARD⟧)"></span><a href="⟦#⟧defn(⟦#ID⟧)-command" title="⚓"></a></code></div>
divert(-1)

	⟧, ⟦

		divert(COMMAND_ARGS_QUEUE)dnl
<a href="SRC_FILE_PATH(SARG1($1))" title="SARG1($1)
date: SARG3(GIT_CSV)
git rev: SARG2(GIT_CSV)
sha1sum: SARG4(GIT_CSV)
size: SARG5(GIT_CSV) B">patsubst(SARG1($1), ⟦.*/⟧)</a> ifelse(SARG2($1), ⟦⟧, ⟦⟧, ⟦ARG2($1) ⟧)dnl
divert(-1)

		# right recursive loop
		$0(shift($@))
	⟧)
⟧)

# no need for further
popdef(⟦#$EXECUTED⟧)
