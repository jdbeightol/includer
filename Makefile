include examples.mk
INSTALL_DIR := $(HOME)/.local/bin

BIN_FILES := pre-process.sh
INSTALL_FILES := $(patsubst %.sh,$(INSTALL_DIR)/%,$(BIN_FILES))

$(INSTALL_DIR):
	@mkdir -p $(INSTALL_DIR)

$(INSTALL_DIR)/%: $(BUILD_DIR)/% $(INSTALL_DIR)
	@cp -v $< $@
	@chmod u+x $@

README.md: sources/README.md includes/*.md
	@./pre-process.sh $< $@

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

