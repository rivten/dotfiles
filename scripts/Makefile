scripts := $(shell find . -maxdepth 1 -type f -executable)

install: $(scripts)

$(scripts):
	ln -sf $(realpath $@) ~/.local/bin/$@

.PHONY: install $(scripts)
