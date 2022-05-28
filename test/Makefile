CC 		     := cc
CFLAGS     := -O3 -std=c99 -Wall -Wextra
INCLUDES   := -I/usr/local/include
LIBS			 := -L/usr/local/lib -lcunit
SRCS			 := main.c
TARGET     := test.out

all:
	$(CC) $(CFLAGS) $(INCLUDES) $(SRCS) -o $(TARGET) $(LIBS)

clean:
	$(RM) $(TARGET)
