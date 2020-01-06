__HEADER([Josef Kubin], [2019/12/24], [root_cz])
___DESCR([the resulting style sheet is embedded in the web page or can be extracted into a separated file])
___POINT([define necessary styles for an article or series])

CSS_RULE_SET([.urs .NSP()tip::before], [
content:"WORD_NOTE: ";
color:NOTE_COLOR;
])

CSS_RULE_SET([.urs .NSP()top], [
text-decoration:none;
])

CSS_RULE_SET([.urs .NSP()jmp], [
text-decoration:none;
font-size:.5em;
vertical-align:super;
])

CSS_RULE_SET([.urs .NSP()un], [
text-decoration:underline;
])

CSS_RULE_SET([.urs .NSP()bl], [
color:blue;
])
