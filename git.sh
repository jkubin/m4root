#!/bin/bash
# __HEADER([Josef Kubin], [2020/03/08], [m4root])
# ___DESCR([extracts data from the git repository for M4 scripts])
# ___POINT([fast code generation])

echo '# DO NOT EDIT! This file is generated automatically!'

for filename in $@; do
	git log -1 --pretty=format:"define([./$filename], [%H, %h, %ai])%n" -- $filename
done
