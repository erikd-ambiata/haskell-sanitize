

CC = gcc

all : dist/build/c-sanitize/c-sanitize
	dist/build/c-sanitize/c-sanitize

clean :
	rm -f csrc/*.o main/*.o dist/build/c-sanitize/c-sanitize

dist/build/c-sanitize/c-sanitize : main/c-sanitize.o csrc/dodgy.o
	mkdir -p $$(dirname $@)
	$(CC) $+ -lasan -o $@

main/c-sanitize.o : main/c-sanitize.c
	$(CC) -Wall -g -I csrc -c $+ -o $@

csrc/dodgy.o : csrc/dodgy.c
	$(CC) -Wall -fsanitize=address -g -I csrc -c $+ -o $@
