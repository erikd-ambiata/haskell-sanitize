

all : dist/build/c-sanitize
	dist/build/c-sanitize


dist/build/c-sanitize : main/c-sanitize.c csrc/dodgy.c
	mkdir -p $$(dirname $@)
	gcc -Wall -fsanitize=address -g -I csrc $+ -o $@
