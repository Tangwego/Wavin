CC= gcc
STATIC= 

###CFLAGS= -O2 -Wall -Wextra 

LIBS= -L. -llua
INCS= -I. -I../lua-5.3.4/src

EXT= wavin
OBJS= wavin.o wv_lex.o wv_lib.o wv_debug.o
MYINC= wavin.h wv_debug.h wv_lex.h wv_lib.h
SRCS= wv_debug.c wv_lex.c wv_lib.c
MAIN= wavin.c
MYLIB= liblua.a
BIN=../bin

compile:
	$(CC) -c $(SRCS) $(MAIN) $(INCS) $(LIBS)
	$(CC) -o $(BIN)/$(EXT) $(OBJS) $(STATIC) $(INCS) $(LIBS)

run:
	$(BIN)/$(EXT) $(BIN)/test.c

clean:
	rm -f *.o
	rm -f $(BIN)/$(EXT)
