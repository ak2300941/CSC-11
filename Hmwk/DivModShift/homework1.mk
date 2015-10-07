#MakeFile
all: homework1

homework1: homework1.o
	gcc -o $@ $+

homework1.o : homework1.s
	as -o $@ $<

clean:
	rm -vf *.o
