examples:
	@mkdir -p examples

examples/%: sources/% examples
	./pre-process.sh $< $@

examples/nested.txt: sources/nested.txt includes/things-generated.txt

includes/things-generated.txt: includes/things.txt
	./pre-process.sh $< $@
