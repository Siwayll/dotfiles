ROOT = $(shell pwd)

.PHONY: install
install:
	ln -s ${ROOT}/zshenv ~/.zshenv
