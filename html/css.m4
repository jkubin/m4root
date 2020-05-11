# vim:ts=10:sw=10

__HEADER([Josef Kubin], [2019/12/24], [root_cz])
___DESCR([the resulting style sheet is embedded in the web page or can be extracted into a separated file])
___POINT([all CSS rules; a subset will be selected into the final style sheet])

# [[prefix1], [prefix2], …], [class_name1, class_name2, …], [[suffix1], [suffix2], …], [… rule set …]
# if the middle bracket set is sempty, M4 template unconditionally places the rule set in the style sheet

# 🖹
CSS_CLASS_RULE_SET([[]],	[note],	[[::before]], [

content:"\1f5b9";
margin-right:.2em;
font-size:1.5em;

])

# ⚠
CSS_CLASS_RULE_SET([[]],	[warn],	[[::before]], [

content:"\26a0";
color:red;
margin-right:.2em;
font-size:1.5em;

])

# ❕
CSS_CLASS_RULE_SET([[]],	[excl],	[[::before]], [

content:"\2755";
margin:0 .4em 0 .2em;
font-size:1.5em;

])

# 🛈
CSS_CLASS_RULE_SET([[]],	[info],	[[::before]], [

content:"\1f6c8";
margin-right:.2em;
font-size:1.5em;

])

CSS_CLASS_RULE_SET([[.urs ]],	[note, info, excl, warn],	[[]], [

padding-top:.2em;
padding-bottom:.4em;

])

CSS_CLASS_RULE_SET([[.urs ]],	[warn],	[[]], [

border-color:red;

])

# ↑
CSS_CLASS_RULE_SET([[ol]],	[refs],	[[ a:first-child::before]], [

content:"\2191";

])

CSS_CLASS_RULE_SET([[ol]],	[refs],	[[ a:first-child]], [

margin-right:.3em;
text-decoration:none;

])

CSS_CLASS_RULE_SET([[]],	[un],	[[]], [

text-decoration:underline;

])

CSS_CLASS_RULE_SET([[]],	[bl],	[[]], [

color:blue;

])

CSS_CLASS_RULE_SET([[p]],	[l2],	[[]], [

padding-left:1em;

])

CSS_CLASS_RULE_SET([[p]],	[l3],	[[]], [

padding-left:2em;

])

CSS_CLASS_RULE_SET([[]],	[unix],	[[]], [

font-weight:bold;

])

CSS_CLASS_RULE_SET([[]],	[ch, bh, usc, root],	[[]], [

position:relative;

])

CSS_CLASS_RULE_SET([[]],	[usc, root],	[[>pre]], [

font-weight:bold;
white-space:normal;
word-break:normal;

])

# counter name for the source code
define([SRC_CNTR], defn([NSP])[nl])

background:#fff;
border-radius:4px;

CSS_CLASS_RULE_SET([[]],	[src],	[[]], [

counter-reset:defn([SRC_CNTR]);

])

font-weight:normal;
CSS_CLASS_RULE_SET([[]],	[src, usc, root],	[[>a]], [

background-color:hsla(0,0%,86%,.5);
border:1px solid #ddd;
border-radius:0 4px;
font-size:.7em;
padding:2px 4px;
position:absolute;
right:0;
top:0;

])

# 🔗
CSS_CLASS_RULE_SET([[]],	[src, usc, root],	[[>a::before]], [

content:"\1f517";

])

font-family:monospace,monospace;
CSS_CLASS_RULE_SET([[]],	[src],	[[>code]], [

border-radius:0 4px;
border:1px solid #ddd;
font-size:.7em;
font-weight:bold;
padding:2px 4px;
position:absolute;
right:0;
text-align:right;
top:0;

])

CSS_CLASS_RULE_SET([[]],	[src],	[[>code a]], [

margin-left:.6em;

])

font-weight:normal;
CSS_CLASS_RULE_SET([[]],	[src],	[[>code>div]], [

background:#eee;
font-weight:initial;
padding:0 2px;
text-align:left;

])

CSS_CLASS_RULE_SET([[]],	[src],	[[>code>span+a]], [

color:inherit;

])

CSS_CLASS_RULE_SET([[]],	[src],	[[>code a+a]], [

font-weight:normal;

])

# 🔗
CSS_CLASS_RULE_SET([[]],	[src],	[[>code a+a::before]], [

content:"\1f517";

])

# removed (the hash revision of the git is pretty self-explanatory)
_CSS_CLASS_RULE_SET([[]],	[src],	[[>code::before]], [

content:"git";
font-weight:normal;
margin-right:.5em;

])

CSS_CLASS_RULE_SET([[]],	[src],	[[>code>span:first-child]], [

cursor:pointer;
text-decoration:#f04c23 underline dashed;

])

# class names for JavaScript code (helps maintain consistency)
define([CLASS_HIGHLIGHT],		defn([NSP])[hgl])
define([CLASS_REAR],		defn([NSP])[re])
define([CLASS_SOURCE],		defn([NSP])[src])
define([CLASS_STRIPE],		defn([NSP])[ev])
define([DEFAULT_HIGHLIGHT_CLASS],	defn([NSP])[dh])

CSS_CLASS_RULE_SET([[]],	[src],	[[>pre.defn([CLASS_REAR])]], [

left:0;
overflow:visible;
padding-left:0;
padding-right:0;
position:absolute;
top:0;

])

CSS_CLASS_RULE_SET([[]],	[src],	[[>pre+pre]], [

background:none;

])

CSS_CLASS_RULE_SET([[]],	[src],	[[], [>pre], [>pre.defn([CLASS_REAR])>div]], [

position:relative;

])

CSS_CLASS_RULE_SET([[.defn([CLASS_STRIPE])]],	[],	[[]], [

background:#f5f5f5;

])

CSS_CLASS_RULE_SET([[]],	[src],	[[>pre.defn([CLASS_REAR])>div::before]], [

content:counter(defn([SRC_CNTR]));
counter-increment:defn([SRC_CNTR]);
left:-3em;
position:absolute;
text-align:right;
top:0;
width:2.5em;

])

# <div></div> must not be empty
CSS_CLASS_RULE_SET([[]],	[src],	[[>pre.defn([CLASS_REAR])>div::after]], [

content:" ";

])

# used for an explanation of an ambiguous word
CSS_CLASS_RULE_SET([[]],	[xp],	[[]], [

border-bottom:1px dotted #000;
cursor:help;

])

# intentionally similar to <abbr title="…">…</abbr>
CSS_CLASS_RULE_SET([[]],	[xp],	[[:active::after]], [

content:" (" attr(title) ")"

])

CSS_CLASS_RULE_SET([[]],	[hgl],	[[]], [

border-bottom:1px dashed #000;
cursor:help;

])

_CSS_CLASS_RULE_SET([[]],	[dot],	[[]], [

border-bottom:1px dotted #000;
cursor:help;

])

CSS_CLASS_RULE_SET([[]],	[usc, root],	[[>pre a]], [

color:inherit;

])

CSS_CLASS_RULE_SET([[]],	[usc],	[[ pre::before]], [

content:"CMD() ";
font-weight:normal;

])

CSS_CLASS_RULE_SET([[]],	[root],	[[ pre::before]], [

content:"ROO() ";
font-weight:normal;

])

# modifies margins of <ul></ul> if used in .rs-tip-major
CSS_CLASS_RULE_SET([[]],	[note],	[[ ul]], [

margin-bottom:0;
margin-left:1em;

])

CSS_CLASS_RULE_SET([[]],	[bh, ch],	[[>a:first-child::before]], [

font-size:.9em;
font-weight:normal;
position:absolute;
right:100%;
width:1.1em;

])

# 🔗
CSS_CLASS_RULE_SET([[]],	[bh],	[[>a:first-child::before]], [

content:"\1f517";

])

# ☰
CSS_CLASS_RULE_SET([[]],	[ch],	[[>a:first-child::before]], [

content:"\2630";

])

CSS_CLASS_RULE_SET([[]],	[ch],	[[>a:first-child+a]], [

margin-right:.4em;

])

_CSS_CLASS_RULE_SET([[]],	[ch, bh],	[[>a:first-child]], [

font-size:.9em;
font-weight:normal;
line-height:normal;

])

# 🡅
CSS_CLASS_RULE_SET([[]],	[ch, bh],	[[>a:last-child::before]], [

content:"\1f845";
font-size:.65em;
margin-left:.3em;
position:absolute;

])

CSS_CLASS_RULE_SET([[]],	[ch, bh],	[[>a:first-child], [>a:last-child]], [

opacity:0;

])

CSS_CLASS_RULE_SET([[]],	[ch, bh],	[[:hover>a:first-child], [:hover>a:last-child]], [

opacity:1;

])

# add space between number and chapter text
CSS_CLASS_RULE_SET([[.urs p[]BRAC(id$="TOC_ANCH")>a>b]],	[],	[[]], [

font-weight:normal;
margin-right:.6em;

])

CSS_CLASS_RULE_SET([[.urs a[]BRAC(id^="defn([NSP], [REF_ANCH])")]],	[],	[[]], [

font-size:.65em;
vertical-align:super

])

# do not break the text in the middle
_CSS_CLASS_RULE_SET([[.urs p>code]],	[],	[[]], [

display:inline-block;

])

# default highlight set
CSS_CLASS_RULE_SET([
[.NSP()A .NSP()a],
[.NSP()B .NSP()b],
[.NSP()C .NSP()c],
[.NSP()D .NSP()d],
[.NSP()E .NSP()e],
[.NSP()F .NSP()f],
[.NSP()G .NSP()g],
[.defn([DEFAULT_HIGHLIGHT_CLASS])]],	[],	[[]], [

background:defn([DEFAULT_HIGHLIGHT_COLOR]);

])

CSS_CLASS_RULE_SET([[.NSP()R .NSP()r]],	[],	[[]], [

background:red;

])

# s = strong
CSS_CLASS_RULE_SET([[.NSP()S .NSP()s]],	[],	[[]], [

font-weight:bold;

])

CSS_CLASS_RULE_SET([[.NSP()X .NSP()x]],	[],	[[]], [

visibility:hidden;

])

_CSS_CLASS_RULE_SET([[.NSP()foo]],	[],	[[]], [

background:yellow;

])

_CSS_CLASS_RULE_SET([[.NSP()bar]],	[],	[[]], [

background:teal;

])

# [[prefix1], [prefix2], …], [id_name1, id_name2], [[suffix1], [suffix2], …], [… rule set …]
CSS_ID_RULE_SET([[]],	defn([NSP], [TOC_ANCH]),	[[]], [

position:relative;

])

CSS_ID_RULE_SET([[]],	defn([NSP], [TOC_ANCH]),	[[ div]], [

color:#888;
position:absolute;
right:0;
text-align:right;
top:0;

])
