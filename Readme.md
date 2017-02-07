haskell-sanitize
================

When writing C code to speed up the most performance critical parts of a
Haskell program, it would be nice to be able to compile that C code with
the [Address Sanitizer](https://clang.llvm.org/docs/AddressSanitizer.html).

Unfortunately, while it is actually possible to compile and link with ASAN,
for some reason ASAN isn't doing its job.

This project contains a mininal reproduction of this issue. The source code
files are as follows:

* csrc/dodgy.c - A C file with an out-of-bounds stack access.
* csrc/dodgy.h - The header file for the above.
* main/c-sanitize.c - A C main function that calls into csrc/dodgy.c.
* main/haskell-sanitize.c - A Haskell main function that calls into csrc/dodgy.c.
* Makefile - A make file to build and run both the Haskell and C versions.

Assuming you already have the Clang C compiler and the ASAN libraries, you will
also need the GHC Haskell compiler, binaries for which are available
[here](https://www.haskell.org/ghc/download_ghc_8_0_2).

With clang, the ASAN libraries and ghc available on the PATH, building and
running this is as simple as:
```
make
```

