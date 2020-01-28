# Generating code in M4
![m4tux](img/m4tux.png?raw=true)
1. install packages
```
# dnf -y install make m4 pinfo
```
2. generate files to generate other files
```
$ make
```
3. generate files from generated files
```
$ make
```
4. delete all generated files
```
$ make cl
```
# For developers
```
$ make h
$ make cl
$ make src html SOURCE=intro.mc exclude=cs
$ make h	<--- the generated file for Makefile provides additional help
$ make spell preview
$ make validate publish
```
> or simply
```
$ make cl
$ make SOURCE=intro.mc ex=cs
$ make
```
> or generate different rules for `Makefile`
```
$ make cl
$ make src fhtml SOURCE=intro.mc ex=cs
$ make h
$ make
```
### Contact (Base64): bTR1bml4QGdtYWlsLmNvbQ
