#!/bin/bash
# __AUTHOR(⟦Josef Kubin⟧, ⟦2020,03,08⟧)
# ___DESCR(⟦generates a simple associative file database for the resulting generated code⟧)
# __REASON(⟦fast code generation using associative memory⟧)

cat << EOF
# DO NOT EDIT! This file is generated automatically!
#
# this is a simple associative file database
#
# define(⟦./path/to/file⟧, ⟦⟦anchor id⟧, ⟦git commit hash⟧, ⟦git abbreviated commit hash⟧, ⟦git author date⟧, ⟦abbreviated sha1sum⟧, ⟦size [B]⟧, ⟦file type⟧⟧)
#
EOF

# extract namespace from the config file
namespace=$(m4 gfiles/root0u.m4 config.m4 nsp.m4)

for filename in $@; do

	if [ -f "$filename" ]; then

		anchor=${filename//./-}
		anchor=${anchor//\//_}
		anchor=${anchor,,}

#		git ls-files --error-unmatch $filename || exit -1
		git log -1 --date='format:%Y%m%d %T' --pretty="format:define(⟦./$filename⟧, ⟦⟦$namespace$anchor⟧, ⟦%H⟧, ⟦%h⟧, ⟦%ad⟧, ⟦" -- $filename
		sha1sum $filename | head -c 7
		stat --printf="⟧, ⟦%s⟧, ⟦%F⟧⟧)\n" $filename
	fi
done
