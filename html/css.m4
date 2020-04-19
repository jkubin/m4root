# vim:ts=10:sw=10

__HEADER([Josef Kubin], [2019/12/24], [root_cz])
___DESCR([the resulting style sheet is embedded in the web page or can be extracted into a separated file])
___POINT([all CSS rules; a subset will be selected into the final style sheet])

# [[prefix1], [prefix2], …], [class_name1, class_name2, …], [[suffix1], [suffix2], …], [… rule set …]
# if the middle bracket set is sempty, place the ruleset unconditionally in the stylesheet

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

font-family:"Courier New",Courier,monospace;
CSS_CLASS_RULE_SET([[]],	[usc, root],	[[>div]], [

background:#fff;
border-radius:4px;
border:1px solid #ddd;
color:#333;
font-family:monospace,monospace;
font-size:.8em;
font-weight:bold;
line-height:1.1;
margin:0 0 11px;
padding:8px;

])

# solved in JavaScript
background:#fff;
border-radius:4px;

CSS_CLASS_RULE_SET([[]],	[src],	[[]], [

counter-reset:NSP()nl;

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

# class names for JavaScript code
define([CLASS_HGL],		[hgl])
define([CLASS_REAR],	[rear])
define([CLASS_SRC],		[src])

CSS_CLASS_RULE_SET([[]],	[src],	[[ pre.NSP()rear]], [

left:0;
overflow:visible;
padding-left:0;
padding-right:0;
position:absolute;
top:0;

])

CSS_CLASS_RULE_SET([[]],	[src],	[[], [>pre], [ pre.NSP()rear div]], [

position:relative;

])

CSS_CLASS_RULE_SET([[]],	[src],	[[ pre.NSP()rear div:nth-child(even)]], [

background:#f5f5f5;

])

CSS_CLASS_RULE_SET([[]],	[src],	[[ pre.NSP()rear div::before]], [

content:counter(NSP()nl);
counter-increment:NSP()nl;
left:-3em;
position:absolute;
text-align:right;
top:0;
width:2.5em;

])

# <div></div> must not be empty
CSS_CLASS_RULE_SET([[]],	[src],	[[ pre.NSP()rear div::after]], [

content:" ";

])

# used for an explanation of an ambiguous word
CSS_CLASS_RULE_SET([[]],	[xp],	[[]], [

border-bottom:1px dotted #000;
cursor:help;

])

CSS_CLASS_RULE_SET([[]],	[hgl],	[[]], [

border-bottom:1px dashed #000;
cursor:help;

])

_CSS_CLASS_RULE_SET([[]],	[dot],	[[]], [

border-bottom:1px dotted #000;
cursor:help;

])

CSS_CLASS_RULE_SET([[]],	[usc, root],	[[ div a]], [

color:inherit;

])

CSS_CLASS_RULE_SET([[]],	[usc],	[[ div::before]], [

content:"CMD() ";
font-weight:normal;

])

CSS_CLASS_RULE_SET([[]],	[root],	[[ div::before]], [

content:"ROO() ";
font-weight:normal;

])

# remove bottom margin of <ul></ul> inside .rs-tip-major
CSS_CLASS_RULE_SET([[]],	[note],	[[ ul]], [

margin-bottom:0;

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
CSS_CLASS_RULE_SET([[.urs ]],	[],	[[p[]BRAC(id$="TOCP")>a>b]], [

font-weight:normal;
margin-right:.6em;

])

# do not break the text in the middle
_CSS_CLASS_RULE_SET([[.urs p>code]],	[],	[[]], [

display:inline-block;

])

# definition of the default highlight color is in the html/cfg.m4
CSS_CLASS_RULE_SET([[.NSP()src.A ]],	[],	[[.a]], [

background:defn([DEFAULT_HIGHLIGHT_COLOR]);

])

# s = strong
CSS_CLASS_RULE_SET([[.NSP()src.S ]],	[],	[[.s]], [

font-weight:bold;

])

CSS_CLASS_RULE_SET([[.NSP()src.X ]],	[],	[[.x]], [

visibility:hidden;

])

# [[prefix1], [prefix2], …], [id_name1, id_name2], [[suffix1], [suffix2], …], [… rule set …]
CSS_ID_RULE_SET([[]],	defn([NSP], [TOCP]),	[[]], [

position:relative;

])

CSS_ID_RULE_SET([[]],	defn([NSP], [TOCP]),	[[ div]], [

color:#888;
position:absolute;
right:0;
text-align:right;
top:0;

])
