__HEADER([Josef Kubin], [2019/12/24], [root_cz])
___DESCR([the resulting style sheet is embedded in the web page or can be extracted into a separated file])
___POINT([here are all CSS rules that are automatically added into the style sheet])

# keep all rule sets sorted

# TODO: id rule set is not finished
# [id_name], [suffix], [… rule set …]
CSS_ID_RULE_SET([one, two, three], [ x], [
test;
])

# how to set class rule set
# [prefix], [class_name1, class_name2, ...], [suffix], [… rule set …]
CSS_CLASS_RULE_SET([], [note], [::before], [
content:"\1f5b9";
margin-right:.2em;
font-size:1.5em;
])

CSS_CLASS_RULE_SET([], [warn], [::before], [
content:"\26a0";
color:red;
margin-right:.2em;
font-size:1.5em;
])

CSS_CLASS_RULE_SET([], [excl], [::before], [
content:"\2755";
margin:0 .4em 0 .2em;
font-size:1.5em;
])

CSS_CLASS_RULE_SET([], [info], [::before], [
content:"\1f6c8";
margin-right:.2em;
font-size:1.5em;
])

CSS_CLASS_RULE_SET([.urs ], [note, info, excl, warn], [], [
padding-top:.2em;
padding-bottom:.4em;
])

CSS_CLASS_RULE_SET([.urs ], [warn], [], [
border-color:red;
])

CSS_CLASS_RULE_SET([ol], [refs], [ a:first-child], [
text-decoration:none;
])

CSS_CLASS_RULE_SET([], [toc], [], [

font-size:.5em;
text-decoration:none;
vertical-align:super;

])

CSS_CLASS_RULE_SET([], [un], [], [
text-decoration:underline;
])

CSS_CLASS_RULE_SET([], [bl], [], [
color:blue;
])

CSS_CLASS_RULE_SET([p], [l2], [], [
padding-left:1em;
])

CSS_CLASS_RULE_SET([p], [l3], [], [
padding-left:2em;
])

CSS_CLASS_RULE_SET([], [unix], [], [
font-weight:bold;
])

CSS_CLASS_RULE_SET([], [usc, root], [], [

background:#fff;
border-radius:4px;
border:1px solid #ddd;
color:#333;
font-family:"Courier New",Courier,monospace;
font-size:.8em;
font-weight:bold;
line-height:1.1;
margin:0 0 11px;
padding:8px;

])

_CSS_CLASS_RULE_SET([], [pre], [], [
overflow:auto;
white-space:pre;
])

CSS_CLASS_RULE_SET([], [src], [], [

background:#fff;
border-radius:4px;
position:relative;

])

CSS_CLASS_RULE_SET([], [src], [ pre], [

background:none;
position:relative;

])

CSS_CLASS_RULE_SET([], [src], [ code], [

border-radius:0 4px;
border:1px solid #ddd;
font-family:monospace,monospace;
font-size:.7em;
font-weight:bold;
padding:2px 4px;
position:absolute;
right:0;
top:0;

])

CSS_CLASS_RULE_SET([], [src], [ a], [
color:#333;
])

CSS_CLASS_RULE_SET([], [src], [ code::before], [

content:"git:";
margin-right:.1em;

])

CSS_CLASS_RULE_SET([], [dot], [], [

border-bottom:1px dotted #000;
cursor:help;

])

text-decoration:underline dotted;	<--- blbe to vypada :(

CSS_CLASS_RULE_SET([], [src], [ code span], [

border-bottom:1px dotted #000;
cursor:help;
margin-right:.6em;

])

CSS_CLASS_RULE_SET([], [src], [ ol], [

font-size:.8em;
left:-2em;
line-height:1.1;
padding:9px 0;
position:absolute;
top:0;

])

# ADD_JAVASCRIPT([src])

CSS_CLASS_RULE_SET([], [src], [ ol li], [

margin:0;
width:640px;

])

CSS_CLASS_RULE_SET([], [src], [ ol li:nth-child(even)], [
background:#f5f5f5;
])

CSS_CLASS_RULE_SET([], [usc, root], [ a], [
color:#333;
])

CSS_CLASS_RULE_SET([], [usc], [::before], [
content:"CMD() ";
font-weight:normal;
])

CSS_CLASS_RULE_SET([], [root], [::before], [
content:"ROO() ";
font-weight:normal;
])

# remove bottom margin of <ul></ul> inside .rs-tip-major
CSS_CLASS_RULE_SET([], [note], [ ul], [
margin-bottom:0;
])

CSS_CLASS_RULE_SET([], [hx], [ a:first-child], [
margin-right:0.5em;
])

CSS_CLASS_RULE_SET([.NSP()hx ], [nav], [], [

visibility:hidden;

])

CSS_CLASS_RULE_SET([], [nav], [], [

margin-left:0.7em;

])

CSS_CLASS_RULE_SET([], [nav], [ a], [
text-decoration:none;
])

CSS_CLASS_RULE_SET([], [nav], [ a:first-child], [
margin-right:0.5em;
])

CSS_CLASS_RULE_SET([.NSP()hx:hover ], [nav], [], [
visibility:visible;
])
