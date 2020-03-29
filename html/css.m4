# vim:ts=10:sw=10

__HEADER([Josef Kubin], [2019/12/24], [root_cz])
___DESCR([the resulting style sheet is embedded in the web page or can be extracted into a separated file])
___POINT([all CSS rules; a subset will be selected into the final style sheet])

# TODO: id rule set is not finished
# [id_name], [suffix], [… rule set …]
CSS_ID_RULE_SET([one, two, three],	[[ x]], [

not-finished:yet;

])

# How to write a CSS class rule set:
#
# [[prefix1], [prefix2], …], [my_class1, my_class2, …], [[suffix1], [suffix2], …], [… rule set …]
CSS_CLASS_RULE_SET([[]],	[note],	[[::before]], [

content:"\1f5b9";
margin-right:.2em;
font-size:1.5em;

])

CSS_CLASS_RULE_SET([[]],	[warn],	[[::before]], [

content:"\26a0";
color:red;
margin-right:.2em;
font-size:1.5em;

])

CSS_CLASS_RULE_SET([[]],	[excl],	[[::before]], [

content:"\2755";
margin:0 .4em 0 .2em;
font-size:1.5em;

])

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

CSS_CLASS_RULE_SET([[ol]],	[refs],	[[ a:first-child]], [

margin-right:.3em;
text-decoration:none;

])

CSS_CLASS_RULE_SET([[]],	[toc],	[[]], [

font-size:.5em;
text-decoration:none;
vertical-align:super;

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

font-family:"Courier New",Courier,monospace;
CSS_CLASS_RULE_SET([[]],	[usc, root],	[[]], [

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

CSS_CLASS_RULE_SET([[]],	[src],	[[]], [

background:#fff;
border-radius:4px;
position:relative;

])

CSS_CLASS_RULE_SET([[]],	[src],	[[>a]], [

background-color:hsla(0,0%,86%,.5);
border-radius:0 4px;
border:1px solid #ddd;
font-size:.7em;
padding:2px 4px;
position:absolute;
right:0;
top:0;

])

CSS_CLASS_RULE_SET([[]],	[src],	[[>pre]], [

background:none;
position:relative;

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
top:0;

])

CSS_CLASS_RULE_SET([[]],	[src],	[[>code a]], [

margin-left:.6em;

])

CSS_CLASS_RULE_SET([[]],	[src],	[[>code>span+a]], [

color:#333;

])

CSS_CLASS_RULE_SET([[]],	[src],	[[>code a+a]], [

font-weight:normal;

])

CSS_CLASS_RULE_SET([[]],	[src],	[[>code::before]], [

content:"git:";
margin-right:.1em;

])

border-bottom:1px dotted #000;
CSS_CLASS_RULE_SET([[]],	[src],	[[>code>span]], [

text-decoration:underline dashed;
cursor:help;

])

CSS_CLASS_RULE_SET([[]],	[src],	[[ ol]], [

font-size:.8em;
left:-2em;
line-height:1.1;
padding:9px 0;
position:absolute;
top:0;

])

CSS_CLASS_RULE_SET([[]],	[src],	[[ ol li]], [

margin:0;
width:640px;

])

CSS_CLASS_RULE_SET([[]],	[src],	[[ ol li:nth-child(even)]], [

background:#f5f5f5;

])

border-bottom:1px dashed #000;
CSS_CLASS_RULE_SET([[]],	[hg],	[[]], [

border-bottom:1px dotted #000;
cursor:help;

])

_CSS_CLASS_RULE_SET([[]],	[dot],	[[]], [

border-bottom:1px dotted #000;
cursor:help;

])

CSS_CLASS_RULE_SET([[]],	[usc, root],	[[ a]], [

color:#333;

])

CSS_CLASS_RULE_SET([[]],	[usc],	[[::before]], [

content:"CMD() ";
font-weight:normal;

])

CSS_CLASS_RULE_SET([[]],	[root],	[[::before]], [

content:"ROO() ";
font-weight:normal;

])

# remove bottom margin of <ul></ul> inside .rs-tip-major
CSS_CLASS_RULE_SET([[]],	[note],	[[ ul]], [

margin-bottom:0;

])

CSS_CLASS_RULE_SET([[]],	[ch, bh],	[[]], [

position:relative;

])

CSS_CLASS_RULE_SET([[]],	[ch],	[[ a:first-child+a]], [

margin-right:.4em;

])

font-size:.65em;
CSS_CLASS_RULE_SET([[]],	[ch, bh],	[[>a:first-child]], [

font-size:.9em;
font-weight:normal;
left:-1.2em;
line-height:normal;
position:absolute;
text-decoration:none;
visibility:hidden;
padding-right:.3em;

])

CSS_CLASS_RULE_SET([[]],	[ch, bh],	[[ sup:last-child]], [

visibility:hidden;
margin-left:.3em;

])

TODO: kdyz bude treti set oddelen carkou, pak to zretezit s prostrednim s carkama
TODO: udelat vnorene cykly
CSS_CLASS_RULE_SET([[]],	[ch, bh],	[[ sup:last-child a]], [

text-decoration:none;

])

CSS_CLASS_RULE_SET([[]],	[ch, bh],	[[:hover a:first-child], [:hover sup:last-child]], [

visibility:visible;

])

_CSS_CLASS_RULE_SET([[]],	[ch],	[[ a:first-child]], [

font-weight:normal;
margin-right:.4em;
text-decoration:none;

])

CSS_CLASS_RULE_SET([[]],	[nav],	[[]], [

margin-left:.7em;

])

CSS_CLASS_RULE_SET([[]],	[nav],	[[ a]], [

text-decoration:none;

])

CSS_CLASS_RULE_SET([[]],	[nav],	[[ a:first-child]], [

margin-right:.5em;

])

# if the middle bracket is sempty, put the ruleset unconditionally to stylesheet
CSS_CLASS_RULE_SET([[.urs ]],	[],	[[p[]LB()id^="NSP()TOCP-"RB()>a>b]], [

font-weight:normal;
margin-right:.6em;

])
