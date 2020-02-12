__HEADER([Josef Kubin], [2019/12/24], [root_cz])
___DESCR([the resulting style sheet is embedded in the web page or can be extracted into a separated file])
___POINT([here are all CSS rules that are automatically selected into the style sheet])

# [prefix], [my_css_name], [suffix], [… css rule set …])
CSS_RULE_SET([], [tip], [::before], [
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

CSS_RULE_SET([div], [usc], [], [

background:#fff;
border-radius:4px;
border:1px solid #ddd;
color:#333;
font-family:"Courier New",Courier,monospace;
font-size:.8em;
line-height:1.1;
margin:0 0 11px;
padding:8px;

])

CSS_RULE_SET([], [usc], [ a], [
font-weight:bold;
])

CSS_RULE_SET([], [usc], [ a:visited], [
color:black;
])

CSS_RULE_SET([], [usc], [::before], [
content:"CMD() ";
])

CSS_RULE_SET([], [root], [::before], [
content:"ROO() ";
])
