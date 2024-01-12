# text-pre-processor

`pre-process.sh` is bash script that can be used to generate files from other
files by including commented `include` statements.

## Usage
To build a file, `DESTINATION` from `SOURCE`, use the following,

```shell
pre-process <SOURCE> <DESTINATION>
```

Include statements within `SOURCE` are resolved from the current working
directory at the time of running pre-process.  If this isn't what you want,
then be sure to change directories before running the tool.

### Environment Variables
The default include statement can be overridden by setting the `INCLUDER`
environment variable prior to running the script.  e.g., if you wanted to use
a commented include line that would be compatible with C-like languages, you
could do the following:

```shell
export INCLUDER="//include"
pre-process source.c
```

Of course, using such a primitive tool to add includes into C-like
languages that often have inclusion, importing, and their own macro definition
langauges isn't likely to be useful.  Instead, the use case of this tool
targets primitive files like configuration languages (txt, ini, yaml, toml,
not json, etc.) or [scripting languages that don't have a reliable dependency
resolution mechanism](https://github.com/jdbeightol/framework).

### Limitations
Included file names should be able to include all printable characters except
newlines, and the `INCLUDER` itself should be able to be set to any string or 
regular expression that doesn't include grave characters ```, but I'm sure 
there are ways to break this script that I haven't covered.

Included files will not be pre-processed by default.  If you want to "nest"
includes, I recommend coordinating such an act with something like make.  See
the nested example and `examples.mk` for ideas on how to do this.
