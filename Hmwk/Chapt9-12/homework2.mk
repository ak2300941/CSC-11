#MakeFile
all: homework1

homework2: homework2.o
	gcc -o $@ $+

homework2.o : homework2.s
	as -o $@ $<

clean:
	rm -vf *.o
