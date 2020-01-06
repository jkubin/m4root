# Generating code in M4
[![unfinished](img/unfinished.gif "The project is under development, anything can change!")](#generating-code-in-m4)
1. install packages
```
# dnf -y install make m4 pinfo
```
2. generate files to generate other files
```
$ make
```
3. generate all other files
```
$ make
```
4. clear generated files
```
$ make cl
```
# For developers
```
$ make h
$ make cl
$ make src rules SOURCE=intro.mc exclude=cs
$ make h	<--- the generated file for Makefile provides additional help
$ make spell preview
$ make validate publish
```
> or simply
```
$ make cl
$ make src rules SOURCE=intro.mc exclude=cs
$ make
```
> or generate other `make` rules
```
$ make cl
$ make src ice SOURCE=intro.mc exclude=cs
$ make
```
### Contact (Base64): bTR1bml4QGdtYWlsLmNvbQ
