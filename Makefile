
CC = clang

all : haskell-sanitize c-sanitize
	./haskell-sanitize
	./c-sanitize

clean :
	rm -f csrc/*.o main/*.o main/*.hi c-sanitize haskell-sanitize

c-sanitize : main/c-sanitize.c csrc/dodgy.c
	$(CC) -Wall -fsanitize=address -g -I csrc $+ -o $@

haskell-sanitize : main/haskell-sanitize.hs csrc/dodgy.c
	ghc -Wall -Icsrc -optc "-fsanitize=address" -optc -g -lasan $+ -o $@
