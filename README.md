# includer

`includer.sh` is bash script that can be used to generate files from other
files by including commented `include` statements.

## Install

To install, use the following makefile command,

```shell
make install
```

A customer installation directory can be set by setting the `INSTALL_DIR`
variable,

```shell
make install INSTALL_DIR=/my/custom/directory/somewhere/on/my/path
```

After installing and ensuring the `INSTALL_DIR` is on your path, the script
should be callable as a command using,

```
includer
```

If it tells you that you are missing an argument then the command is working.

## Usage
To build a file, `DESTINATION` from `SOURCE`, use the following,

```shell
includer <SOURCE> <DESTINATION>
```

Include statements within `SOURCE` are resolved from the current working
directory at the time of running includer.  If this isn't what you want,
then be sure to change directories before running the tool.

### Use Case
The use case of this tool is to generate primitive files like configuration 
markup languages (txt, ini, yaml, toml, not json lol, etc.) or
[scripting languages that don't have a reliable dependency
resolution mechanism](https://github.com/jdbeightol/framework).  This tool
allows the author of a file to compose a single, distributable output file from
many, better-organized files.

### Motivation
The motivating problem that spawned this tool was the inability to compose a
[Hashicorp nomad](https://www.nomadproject.io/) job spec with multiple inline
templates from external sources.  While future implementations of nomad may
allow including external files from the host's machine at deployment time,
the current HCL implementation in nomad requires template files to either be
accessible within the the container itself (possibly downloaded as an artifact
or mounted in from elsewhere) or specified inline using the `data = <<EOF`
syntax.  This tool allowed me to use the `data = <<EOF` implementation with an
include statement, so that the actual yaml files I wanted to include could be
stored separately and opened individually with all the benefits of my editor of
choice.

As a bonus, I will likely also use this to replace my `framework.sh` bash
scripts with single files that can be distributed without a dependency on
how the user's environment is configured.  Storage is cheap, so shared
dependencies just don't have the attractiveness that they used to, and runtime
dependency linking/resolution just moves the development frustration to the
user.

### Limitations
Included file names should be able to include all printable characters except
newlines, and the `INCLUDER` itself should be able to be set to any string or 
regular expression that doesn't include grave characters ```, but I'm sure 
there are ways to break this script that I haven't covered.

Included files will not be includered by default.  If you want to "nest"
includes, I recommend coordinating such an act with something like make.  See
the nested example and `examples.mk` for ideas on how to do this.

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
