CC = g++  
CFLAGS = -Wall -g  
LDFLAGS = -lm  
  
all:threadpoolmanager.o threadpool.o taskpool.o main.o main
	  
threadpoolmanager.o: threadpoolmanager.h threadpool.h taskpool.h commondef.h
	${CC} ${CFLAGS} -c threadpoolmanager.cpp
threadpool.o:threadpool.h taskpool.h commondef.h
	${CC} ${CFLAGS} -c threadpool.cpp
taskpool.o:taskpool.h commondef.h
	${CC} ${CFLAGS} -c taskpool.cpp
main.o : threadpoolmanager.h  
	${CC} ${CFLAGS} -c main.cpp
main: taskpool.o threadpoolmanager.o threadpool.o main.o  
	${CC} ${CFLAGS} taskpool.o threadpoolmanager.o threadpool.o main.o ${LDFLAGS} -o main -lpthread

clean:  
	rm -rf *.o  
	rm -rf main
