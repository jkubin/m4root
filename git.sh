#!/bin/bash
# __HEADER([Josef Kubin], [2020/03/08], [m4root])
# ___DESCR([generates a simple associative file database for the resulting generated code])
# ___POINT([fast code generation using associative memory])

cat << EOF
# DO NOT EDIT! This file is generated automatically!
#
# This is a simple associative file database.
#
# define([./path/to/file], [[git commit hash], [git abbreviated commit hash], [git author date], [abbreviated sha1sum], [size [B]], [file type]])
#
EOF

for filename in $@; do
	git log -1 --date='format:%Y%m%d.%T' --pretty="format:define([./$filename], [[%H], [%h], [%ad], [" -- $filename
	sha1sum $filename | head -c 7
	stat --printf="], [%s], [%F]])\n" $filename
done
