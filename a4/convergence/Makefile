CC=mpicc
CFLAGS=-O3 -lm -Wall
RES=-DPRINT_RESULTS
CONV=-DTEST_CONV

all: jacobi seidelsor redblacksor


jacobi: mpi_Jacobi.c utils.c 
	$(CC) $(CFLAGS) $(CONV) mpi_Jacobi.c utils.c -o jacobi

seidelsor: mpi_GaussSeidelSOR.c utils.c  
	$(CC) $(CFLAGS) $(CONV) mpi_GaussSeidelSOR.c utils.c -o seidelsor

redblacksor: mpi_RedBlackSOR.c utils.c  
	$(CC) $(CFLAGS) $(CONV) mpi_RedBlackSOR.c utils.c -o redblacksor

clean: 
	rm jacobi jacobi_conv seidelsor
