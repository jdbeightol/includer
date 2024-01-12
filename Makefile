include examples.mk

BIN_FILE := pre-process.sh

INSTALL_DIR := $(HOME)/.local/bin
INSTALL_FILES := $(patsubst %.sh,$(INSTALL_DIR)/%,$(BIN_FILE))

$(INSTALL_DIR):
	@mkdir -p $(INSTALL_DIR)

$(INSTALL_DIR)/%: $(BIN_FILE) $(INSTALL_DIR)
	@cp -v $< $@
	@chmod u+x $@

README.md: examples/README.md
	@cp $< $@

all: $(patsubst sources/%,examples/%,$(wildcard sources/*))
.PHONY: all

clean:
	@rm -rf examples
.PHONY: clean

install: $(INSTALL_FILES)
.PHONY: install

uninstall:
	@rm -rvf $(INSTALL_FILES)
.PHONY: uninstall
