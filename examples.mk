# This builds the examples directory.  It's not very interesting.
examples:
	@mkdir -p examples

# This builds a generated file (`examples/`) from source files (`sources/`)
# that we jknow are dependent upon various included files (`includes/`).
#
# The examples directory is a dependency as a place to output the generated
# files.
#
# The `includes/*` dependency is to be sure that example files are rebuilt
# if any changes are made to included files.
examples/%: sources/% examples includes/*
	./includer.sh $< $@

# This is an example of how you can do nested includes using intermediate
# files.  It's not perfect, but I'm not convinced that recursive inclusion is
# a necessary feature yet.
examples/nested.txt: sources/nested.txt includes/things-generated.txt
includes/things-generated.txt: includes/things.txt
	./includer.sh $< $@
