## Examples
To view and explore the examples in this project, you can use the included
`Makefile` to generate them.  To build all examples, use the following,

```
make all
```

Generated examples will be stored in the `examples/` directory. They are
generated directly from files in the `sources/` directory.  Finally, by
convention of these examples only, files in the sources directory include
files from the `includes/` directory.

To build any individual example --whatever your reason, specify the filename
you wish to build,

```
make examples/example.txt
```

The `examples.mk` file includes the necessary targets to build the examples,
while the `Makefile` includes phony targets and the logic to install the binary
under `$HOME/.local/bin` if you would like.

### README
As a note, this readme itself is built from included files using the makefile.
Feel free to play with it.  I don't think it's a necessary pattern to break up
readme files, but it sure is a fun example here.
