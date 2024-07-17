# Makefile to compile server.s program using gcc

# Define the compiler
CC=gcc

# Define the source file
SRC=server.s

# Define the output executable
OUT=server

# Default target
all: $(OUT)

# Rule to build the executable
$(OUT): $(SRC)
    $(CC) -o $(OUT) $(SRC)

# Clean target to remove the executable
clean:
    rm -f $(OUT)