## Examples
To view and explore the examples in this project, you can use the included
`Makefile` to generate them.  To build all examples, use the following,

```
make all
```

To build any individual example --whatever your reason, specify the filename
you wish to build,

```
make examples/example.txt
```

The `examples.mk` file includes the necessary targets 

### README
As a note, this readme itself is built from included files using the makefile.
Feel free to play with it.  I don't think it's a necessary pattern to break up
readme files, but it sure is a fun example here.
