# A → β
define([TARGET], [hello])

divert(0)dnl
[#] DONTE()

.PHONY: TARGET
TARGET:
	$(info SYMBOL)
	@:
