# vim:ts=10:sw=10

__HEADER([Josef Kubin], [2019/12/24], [root_cz])
___DESCR([the resulting style sheet is embedded in the web page or can be extracted into a separated file])
___POINT([all CSS rules; a subset will be selected into the final style sheet])

# [[prefix1], [prefix2], …], [id_name1, id_name2], [[suffix1], [suffix2], …], [… rule set …]
CSS_ID_RULE_SET([[]],	defn([NSP], [TOCP]),	[[]], [

position:relative;

])

CSS_ID_RULE_SET([[]],	defn([NSP], [TOCP]),	[[ div]], [

color:#666;
position:absolute;
right:0;
text-align:right;
top:0;

])


# [[prefix1], [prefix2], …], [class_name1, class_name2, …], [[suffix1], [suffix2], …], [… rule set …]
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

CSS_CLASS_RULE_SET([[]],	[usc, root],	[[]], [

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

CSS_CLASS_RULE_SET([[]],	[src],	[[]], [

background:#fff;
border-radius:4px;
counter-reset:NSP()nl;
position:relative;

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

# git revision number is obvious
_CSS_CLASS_RULE_SET([[]],	[src],	[[>code::before]], [

content:"git";
font-weight:normal;
margin-right:.5em;

])

CSS_CLASS_RULE_SET([[]],	[src],	[[>code>span:first-child]], [

cursor:pointer;
text-decoration:#f04c23 underline dashed;

])

CSS_CLASS_RULE_SET([[]],	[src],	[[ pre.rear]], [

left:0;
overflow:visible;
padding-left:0;
padding-right:0;
position:absolute;
top:0;

])

CSS_CLASS_RULE_SET([[]],	[src],	[[ pre.rear div]], [

position:relative;

])

CSS_CLASS_RULE_SET([[]],	[src],	[[ pre.rear div:nth-child(even)]], [

background:#f5f5f5;

])

CSS_CLASS_RULE_SET([[]],	[src],	[[ pre.rear div::before]], [

content:counter(NSP()nl);
counter-increment:NSP()nl;
left:-3em;
position:absolute;
text-align:right;
top:0;
width:2.5em;

])

CSS_CLASS_RULE_SET([[]],	[src],	[[ pre.rear div::after]], [

content:" ";

])

border-bottom:1px dashed #000;
CSS_CLASS_RULE_SET([[]],	[hg],	[[]], [

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

CSS_CLASS_RULE_SET([[]],	[ch, bh],	[[]], [

position:relative;

])

CSS_CLASS_RULE_SET([[]],	[ch],	[[>span:first-child+a]], [

margin-right:.4em;

])

font-size:.65em;
CSS_CLASS_RULE_SET([[]],	[ch, bh],	[[>span:first-child]], [

font-size:.9em;
font-weight:normal;
left:-1.2em;
line-height:normal;
position:absolute;
padding-right:.3em;

])

CSS_CLASS_RULE_SET([[]],	[ch, bh],	[[>sup:last-child]], [

visibility:hidden;
margin-left:.3em;

])

CSS_CLASS_RULE_SET([[]],	[ch, bh],	[[>span:first-child>a], [>sup:last-child>a]], [

text-decoration:none;
visibility:hidden;

])

CSS_CLASS_RULE_SET([[]],	[ch, bh],	[[:hover>span:first-child>a], [:hover>sup:last-child>a]], [

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

# if the middle bracket is sempty, place the ruleset unconditionally in the stylesheet

# add space between number and chapter text
CSS_CLASS_RULE_SET([[.urs ]],	[],	[[p[]BRAC(id$="TOCP")>a>b]], [

font-weight:normal;
margin-right:.6em;

])

# do not break the text in the middle
_CSS_CLASS_RULE_SET([[.urs p>code]],	[],	[[]], [

display:inline-block;

])

_CSS_CLASS_RULE_SET([[.urs a>code]],	[],	[[]], [

display:inline;

])
