stack : stack.o
  gcc -o stack stack.o

stack.o : stack.s
  as -g -o stack.o stack.s

clean :
  rm stack stack.o
