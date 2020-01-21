__HEADER([Josef Kubin], [2019/12/24], [root_cz])
___DESCR([the resulting style sheet is embedded in the web page or can be extracted into a separated file])
___POINT([here are all CSS rules that are automatically selected into the style sheet])

# [an prefix], [css_name], [suffix], [… css rule set …])
CSS_RULE_SET([.urs ], [tip], [::before], [
content:"WORD_NOTE: ";
color:#969696;
])

CSS_RULE_SET([.urs ], [top], [], [
text-decoration:none;
])

CSS_RULE_SET([.urs ], [dot], [], [
border-bottom:1px dotted #000;
])

CSS_RULE_SET([.urs ], [toc], [], [
text-decoration:none;
font-size:.5em;
vertical-align:super;
])

CSS_RULE_SET([.urs ], [un], [], [
text-decoration:underline;
])

CSS_RULE_SET([.urs ], [bl], [], [
color:blue;
])

CSS_RULE_SET([.urs p], [level2], [], [
padding-left:1em;
])

CSS_RULE_SET([.urs p], [level3], [], [
padding-left:2em;
])

CSS_RULE_SET([.urs th], [inputs], [], [
width:100%;
])

CSS_RULE_SET([.urs th], [inputs], [ a], [
margin-right:1em;
])
