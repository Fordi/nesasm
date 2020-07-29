# Potentially OS-specific
RMDIR   = rm -rf
CP      = cp
USR_BIN = /usr/local/bin
CC      = gcc
MKDIR_P = mkdir -p
CFLAGS  = -O2 -Wall

# Directories
OUT = bin
SRC = src

# Object dependencies
NESASM_DEPS     = $(OUT)/main.o \
           $(OUT)/input.o \
           $(OUT)/assemble.o \
           $(OUT)/expr.o \
           $(OUT)/code.o \
           $(OUT)/command.o\
           $(OUT)/macro.o \
           $(OUT)/func.o \
           $(OUT)/proc.o \
           $(OUT)/symbol.o \
           $(OUT)/pcx.o \
           $(OUT)/output.o \
           $(OUT)/crc.o\
           $(OUT)/pce.o \
           $(OUT)/map.o \
           $(OUT)/mml.o \
           $(OUT)/nes.o

NESASM  = $(OUT)/nesasm

# default target
default: all

# Header file dependencies
$(NESASM_DEPS) : $(SRC)/defs.h $(SRC)/externs.h $(SRC)/protos.h
$(OUT)/main.o  : $(SRC)/inst.h $(SRC)/vars.h
$(OUT)/expr.o  : $(SRC)/expr.h
$(OUT)/pce.o   : $(SRC)/pce.h
$(OUT)/nes.o   : $(SRC)/nes.h

# Binaries
$(NESASM) : $(OUT) $(NESASM_DEPS)
	$(CC) -o $(NESASM)  $(NESASM_DEPS)

# Custom targets
all: $(NESASM)

install:
	$(CP) $(NESASM) $(USR_BIN)

# Common
$(OUT):
	$(MKDIR_P) $(OUT)

clean:
	$(RMDIR) -rf $(OUT)

$(OUT)/%.o : $(SRC)/%.c
	$(CC) $(CFLAGS) -o $@ -c $< > $@.log 2>&1
