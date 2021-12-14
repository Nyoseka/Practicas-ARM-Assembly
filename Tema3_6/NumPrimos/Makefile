numprimos : numprimos.o
  ld -o numprimos numprimos.o
  
numprimos.o : numprimos.s
  as -o numprimos.o numprimos.s
  
clean :
  rm numprimos numprimos.o
