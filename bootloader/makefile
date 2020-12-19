# arm-eabi-gcc -T boot.lds -ffreestanding -nostdlib -nostdinc init.S start.c -o boot.out
# objcopy -O binary boot.out boot.bin

START_ADDR=0x402F0400

SOURCES=../init.S\
		../start.c
APPNAME = boot

CC=arm-eabi-gcc
OBJCOPY=arm-eabi-objcopy
CFLAGS+=-ffreestanding -nostdlib

BUILDDIR = "./build"

all: builddir | mlo

builddir:
	@echo "building directory $(BUILDDIR)"
	mkdir -p $(BUILDDIR)

mlo: bin
	cd build; python ../../tools/image.py

bin: build
	${OBJCOPY} -O binary $(BUILDDIR)/${APPNAME}.out $(BUILDDIR)/${APPNAME}.bin

build:
	$(CC) -T boot.lds ${CFLAGS} ${SOURCES} -o $(BUILDDIR)/${APPNAME}.out

clean:
	@echo cleaning...
	rm -rf build/*
