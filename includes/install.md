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
pre-process
```

If it tells you that you are missing an argument then the command is working.
