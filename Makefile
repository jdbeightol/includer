examples:
	@mkdir -p examples

examples/%: sources/% examples
	@./pre-process $< $@

all: $(patsubst sources/%,examples/%,$(wildcard sources/*))
.PHONY: all

clean:
	@rm -rf examples
.PHONY: clean
