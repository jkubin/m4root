__AUTHOR(⟦Josef Kubin⟧, ⟦2019,12,15⟧)
___DESCR(⟦processes a source file for HTML; converts forbidden characters; sets string highlighting using REGEX⟧)
__REASON(⟦inserts a source file or just a snippet for HTML⟧)

# WARNING:
# This file with `⟦⟧' cannot be directly rewritten to other control characters
# due to the following hex-a codes used to hide the unpaired `⟦⟧' in sed REGEX:
#
# echo -n '⟦' | hexdump -C
# 00000000  e2 9f a6
#
# echo -n '⟧' | hexdump -C
# 00000000  e2 9f a7

# Usage:
# inserts file as is
# TEXTDATA(⟦⟦path/file.src⟧⟧)
#
# inserts file as is with a possible ID if inserted multiple times
# TEXTDATA(⟦⟦path/file.src,ID⟧⟧)
# TEXTDATA(⟦⟦path/file.src,1⟧⟧)
# TEXTDATA(⟦⟦path/file.src,2⟧⟧)
# TEXTDATA(⟦⟦path/file.src,foo⟧⟧)
#
# apply a REGEX to the inserted file
# TEXTDATA(⟦⟦path/file.src⟧, ⟦s/\<foo\>/HH(a)/g;s/\<bar\>/HH(b)/g⟧⟧)
#
# inserts source code snippet from line 10 to the EOF
# TEXTDATA(⟦⟦path/file.src⟧, ⟦REGEX⟧, 10⟧)
#
# inserts source code snippet from line 10 to 20
# TEXTDATA(⟦⟦path/file.src⟧, ⟦REGEX⟧, 10, 20⟧)
#
# inserts the file from line 10 to end, no regular expression
# TEXTDATA(⟦⟦path/file.src⟧, ⟦⟧, 10⟧)
#
# inserts the file from line 10 to line 30, no regular expression
# TEXTDATA(⟦⟦path/file.src⟧, ⟦⟧, 10, 30⟧)
#
# uses a different ID than the file itself
# TEXTDATA(⟦id⟧, ⟦⟦path/file.src⟧⟧)
# TEXTDATA(⟦id⟧, ⟦title⟧, ⟦⟦path/file.src⟧⟧)
# TEXTDATA(⟦id⟧, ⟦title⟧, ⟦class⟧, ⟦style⟧, ⟦anything⟧, ⟦⟦path/file.src⟧⟧)
# TEXTDATA(, ⟦title⟧, ⟦⟦path/file.src,ID⟧⟧)

# the following macro is similar to TEXTDATA() except REGEX
# TEXTDATA_MLH(⟦⟦path/file.src⟧⟧)
#
# REGEX processes the file as a one long string to match multiple lines
# TEXTDATA_MLH(⟦⟦path/file.src⟧, ⟦REGEX⟧⟧)
#
# an example of multi-line highlighting:
# TEXTDATA_MLH(⟦⟦path/file.src⟧, ⟦s/\\n"\n"/HH(a)/⟧⟧)
# …
#
# Notes:
# HH(b) is not a macro!
# HH(b) is replaced by regex to <span class="NSP()b">&<\x2fspan>

# β
pushdef(⟦ID_1_FILE⟧,	⟦ifelse(⟦$#⟧, ⟦1⟧, ⟦SARG1(GIT_CSV)defn(⟦#ID⟧)⟧, ⟦$1⟧, ⟦⟧, ⟦SARG1(GIT_CSV)defn(⟦#ID⟧)⟧, ⟦ADD_ID_MONO(⟦$1⟧)⟧)⟧)
pushdef(⟦TITLE_2⟧,	⟦ifelse(⟦$#⟧, ⟦2⟧, ⟦⟧, ⟦$2⟧, ⟦⟧, ⟦⟧, ⟦⟦ title="$2"⟧⟧)⟧)
pushdef(⟦CLASS_3⟧,	⟦ifelse(⟦$#⟧, ⟦3⟧, ⟦⟧, ⟦$3⟧, ⟦⟧, ⟦⟧, ⟦ ADD_CLASS(⟦$3⟧)⟧)⟧)
pushdef(⟦STYLE_4⟧,	⟦ifelse(⟦$#⟧, ⟦4⟧, ⟦⟧, ⟦$4⟧, ⟦⟧, ⟦⟧, ⟦⟦ style="$4"⟧⟧)⟧)
pushdef(⟦ANYTHING_5⟧,	⟦ifelse(⟦$#⟧, ⟦5⟧, ⟦⟧, ⟦$5⟧, ⟦⟧, ⟦⟧, ⟦⟦ $5⟧⟧)⟧)

# A → β
# β
define(⟦TEXTDATA⟧, ⟦

	ADD_JAVASCRIPT_FOR_SOURCE_CODE()

	$0_LAST_ARG(⟧defn(⟦EXPAND_LAST_ARG⟧)⟦)

	# completes the resulting HTML code from previously prepared pieces of code
	divert(CURRQU)dnl
<div id="⟧defn(⟦ID_1_FILE⟧)⟦" class="ADD_CLASS(⟦src⟧)⟧defn(⟦CLASS_3⟧)"⟦undivert(AUXILIARY_2_QUEUE)><pre⟦⟧⟧defn(⟦TITLE_2⟧, ⟦STYLE_4⟧, ⟦ANYTHING_5⟧)⟦>dnl
SARG1(esyscmd(defn(⟦COMMAND_FOR_TEXTDATA⟧)))</pre><code><span class="ADD_CLASS(⟦sha⟧)">SARG3(GIT_CSV)</span>dnl
undivert(AUXILIARY_1_QUEUE)dnl
date: SARG4(GIT_CSV)
sha1sum: SARG5(GIT_CSV)
size: SARG6(GIT_CSV) B">undivert(AUXILIARY_3_QUEUE)</a>dnl
<span class="ADD_CLASS(⟦cb⟧)" title="defn(⟦WORD_CLIPBOARD⟧)"></span><a href="⟦#⟧⟧defn(⟦ID_1_FILE⟧)⟦" title="⚓"></a></code></div>
divert(-1)

	# tests the return value of the command
	ifelse(sysval, ⟦0⟧, ⟦⟧, ⟦

		# displays a complete failed command
		ROOT_ERROR(⟦‘$0($@)’ → $ ⟧defn(⟦COMMAND_FOR_TEXTDATA⟧))
	⟧)

	# prints the resulting command used
	ifdef(⟦DEBUG⟧, ⟦errprint(__file__:__line__: defn(⟦COMMAND_FOR_TEXTDATA⟧)
)⟧)
⟧)

# the file is inserted into the sed buffer as one long string for multi-line regular expression processing
# the rest is the same as TEXTDATA()
# A → β
define(⟦TEXTDATA_MLH⟧, defn(⟦TEXTDATA⟧))

# A → β
# β
define(⟦TEXTDATA_LAST_ARG⟧, ⟦

	# the ID distinguishes the same file if it is inserted multiple times into an HTML document
	define(⟦#ID⟧, ifelse(SARG2($1), ⟦⟧, ⟦⟧, ⟦-SARG2($1)⟧))

	# generates the CSS code with the starting number if the starting line number of the file was used
	ifelse(
		⟦$3⟧, ⟦⟧, ⟦⟧,
		⟦$3⟧, ⟦1⟧, ⟦⟧, ⟦

		# test the starting input parameter for digits
		ifelse(patsubst(⟦⟦$3⟧⟧, ⟦[0-9]⟧), ⟦⟧, ⟦⟧, ⟦

			ROOT_ERROR(⟦‘the parameter of TEXTDATA…(⟦⟦path/to/the/included.file⟧, ⟦REGEX⟧, ⟦$3⟧⟧)’ must be a number or empty string⟧)
		⟧)

		divert(AUXILIARY_2_QUEUE)dnl
 style="counter-reset:defn(⟦SOURCE_COUNTER⟧) decr($3)"dnl
divert(-1)
	⟧)

	$0_LOAD_FILE(
SARG1($1),dnl path/to/the/included.file
⟦$2⟧,dnl regex to modify the included.file
ifelse(⟦$3⟧, ⟦⟧, ⟦⟦1⟧⟧, ⟦⟦$3⟧⟧),dnl start line of the file: ⟦⟧ or ⟦NUM⟧
ifelse(⟦$4⟧, ⟦⟧, ⟦⟦$⟧⟧, ⟦⟦$4⟧⟧),dnl end line of the file: ⟦⟧ or ⟦NUM⟧
ifelse(⟦$4⟧, ⟦⟧, ⟦⟦s/$/\xe2\x9f\xa7,/⟧⟧, ⟦$4⟧, ⟦$⟧, ⟦⟦s/$/\xe2\x9f\xa7,/⟧⟧, ⟦⟦s/$/\n…\xe2\x9f\xa7,/⟧⟧)dnl constructs regex if end is: ⟦⟧ or ⟦$⟧ or ⟦NUM⟧
)
⟧)

# A → β
define(⟦TEXTDATA_MLH_LAST_ARG⟧, defn(⟦TEXTDATA_LAST_ARG⟧))

# β
pushdef(⟦COMMON_CODE⟧, ⟦

	# finds a record from a hash database
	define(⟦GIT_CSV⟧, defn(⟦./$1⟧))

	ifelse(defn(⟦GIT_CSV⟧), ⟦⟧, ⟦

		ROOT_ERROR(⟦file record for ‘$1’ not found, regenerate file database⟧)
	⟧)

	divert(AUXILIARY_1_QUEUE)dnl
<a href="SRC_FILE_PATH(⟦$1⟧)" title="⟦$1⟧
divert(AUXILIARY_3_QUEUE)dnl
patsubst(⟦$1⟧, ⟦.*/⟧)⟦⟧dnl
divert(-1)
⟧)

# regex cannot be changed to: ⟦sed -ne '$3,$4{' -f html/chr_to_esc.sed -e '⟧patsubst(⟦⟦$2⟧⟧, ⟦\<HH(\([^)]+\))⟧, ⟦<span class="⟧defn(⟦NSP⟧)⟦\1">&<\\x2fspan>⟧)⟦' -e '$3s/^/\xe2\x9f\xa6/;$4$5;p}' $1⟧
# the problem is NSP() in the ⟦<span class="NSP()r">\1<\x2fspan>⟧ which will not be expanded (if the regex above is used)
# because of the following use case: TEXTDATA(⟦⟦messages/messages.ini.m4⟧, ⟦/^\[/s/\(.0\)\(_NAME\)/<span class="NSP()r">\1<\x2fspan><span class="NSP()a">\2<\x2fspan>/⟧⟧)
# A → β
define(⟦TEXTDATA_LAST_ARG_LOAD_FILE⟧, defn(⟦COMMON_CODE⟧)⟦

	define(⟦COMMAND_FOR_TEXTDATA⟧,
	⟦sed -ne '$3,$4{' -f html/chr_to_esc.sed -e '⟧patsubst(patsubst(⟦⟦⟦$2⟧⟧⟧, ⟦\<HH(\([^)]+\))⟧, ⟦<span class="NSP()\1">&<\\x2fspan>⟧), ⟦NSP()⟧, defn(⟦NSP⟧))⟦' -e '$3s/^/\xe2\x9f\xa6/;$4$5;p}' $1⟧)
⟧)

# loads the file into the sed buffer
# A → β
define(⟦TEXTDATA_MLH_LAST_ARG_LOAD_FILE⟧, defn(⟦COMMON_CODE⟧)⟦

	define(⟦COMMAND_FOR_TEXTDATA⟧,
	⟦sed -ne '$3{:a;N;$4!ba' -f html/chr_to_esc.sed -e '⟧patsubst(patsubst(⟦⟦⟦$2⟧⟧⟧, ⟦\<HH(\([^)]+\))⟧, ⟦<span class="NSP()\1">&<\\x2fspan>⟧), ⟦NSP()⟧, defn(⟦NSP⟧))⟦' -e 's/^/\xe2\x9f\xa6/;$5;p}' $1⟧)dnl
⟧)

popdef(

	⟦ANYTHING_5⟧,
	⟦CLASS_3⟧,
	⟦COMMON_CODE⟧,
	⟦ID_1_FILE⟧,
	⟦STYLE_4⟧,
	⟦TITLE_2⟧,

)
