__HEADER([Josef Kubin], [2019/12/24], [root_cz])
___DESCR([the resulting style sheet is embedded in the web page or can be extracted into a separated file])
___POINT([here are all CSS rules that are automatically selected into the style sheet])

# [prefix], [my_css_name], [suffix], [… css rule set …])
CSS_RULE_SET([], [note], [::before], [
content:"\1f5b9";
color:#969696;
margin-right:.4em;
font-size:1.5em;
])

color:orange;
vertical-align:-50%;

CSS_RULE_SET([], [warn], [::before], [
content:"\26a0";
color:red;
margin-right:.4em;
font-size:1.5em;
])

CSS_RULE_SET([], [excl], [::before], [
content:"\2755";
color:#969696;
margin:0 .5em 0 .2em;
font-size:1.5em;
])

CSS_RULE_SET([], [info], [::before], [
content:"\1f6c8";
color:#969696;
margin-right:.4em;
font-size:1.5em;
])

CSS_RULE_SET([], [note], [], [
padding-top:.2em;
])

CSS_RULE_SET([], [info], [], [
padding-top:.2em;
])

CSS_RULE_SET([], [excl], [], [
padding-top:.2em;
])

CSS_RULE_SET([], [warn], [], [
padding-top:.2em;
border-color:red;
])

# [prefix], [my_css_name], [suffix], [… css rule set …])
_CSS_RULE_SET([], [tip], [::before], [
content:"WORD_NOTE: ";
color:#969696;
])

CSS_RULE_SET([], [top], [], [
text-decoration:none;
])

CSS_RULE_SET([], [dot], [], [
border-bottom:1px dotted #000;
])

CSS_RULE_SET([], [toc], [], [
text-decoration:none;
font-size:.5em;
vertical-align:super;
])

CSS_RULE_SET([], [un], [], [
text-decoration:underline;
])

CSS_RULE_SET([], [bl], [], [
color:blue;
])

CSS_RULE_SET([p], [l2], [], [
padding-left:1em;
])

CSS_RULE_SET([p], [l3], [], [
padding-left:2em;
])

CSS_RULE_SET([], [unix], [], [
font-weight:bold;
])
quotes:"„" "“";

# TODO: unfinished
CSS_RULE_SET([], [usc], [,.urs .NSP()root], [

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

CSS_RULE_SET([], [pre], [], [
overflow:auto;
white-space:pre;
])

CSS_RULE_SET([], [src], [], [
position:relative;
])

CSS_RULE_SET([], [src], [ a], [

background:hsla(0,0%,86%,.5);
border-radius:0 4px;
border:1px solid #ddd;
font-family:"Courier New",Courier,monospace;
font-size:.8em;
font-weight:bold;
padding:0 .3em;
position:absolute;
right:0;

])

CSS_RULE_SET([], [src], [ a:visited], [
color:#333;
])

.down:hover a{display:inline;}

_CSS_RULE_SET([], [src], [:hover a], [
background:#fff;
])

_CSS_RULE_SET([], [src], [ a::before], [
content:"git: ";
])

CSS_RULE_SET([], [usc], [ a:visited], [
color:#333;
])

CSS_RULE_SET([], [usc], [::before], [
content:"CMD() ";
font-weight:normal;
])

CSS_RULE_SET([], [root], [::before], [
content:"ROO() ";
font-weight:normal;
])
