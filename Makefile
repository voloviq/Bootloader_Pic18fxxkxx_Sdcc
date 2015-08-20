CC=sdcc
AS=gpasm
LD=gplink

FAMILY=pic16
MCU=18f26k80
OFLAGS= --obanksel=9 --optimize-cmp --optimize-df --denable-peeps --opt-code-size --use-non-free
CFLAGS= -S -m$(FAMILY) -p$(MCU) -Wall -I C:\SDCC\non-free\include\pic16 -I. $(OFLAGS)
ASFLAGS=
LDFLAGS= -I C:\SDCC\lib\pic16 -I C:\SDCC\non-free\include\pic16 -I C:\SDCC\non-free\lib\pic16 -w -r -m -s $(MCU).lkr

OUTPUT=bootloader

CSRCS=main.c

ASMSRCS = $(CSRCS:.c=.asm)
OBJS = $(ASMSRCS:.asm=.o)

all: $(OUTPUT)_code.bin $(OUTPUT)_config.bin

$(OUTPUT)_code.bin: $(OUTPUT).hex
	$(OUTPUT).hex -intel -crop 0x0 0x0FFF -o $(OUTPUT)_code.bin -binary

$(OUTPUT)_config.bin: $(OUTPUT).hex
	$(OUTPUT).hex -intel -crop 0x300000 0x30000D -offset -0x300000 -o $(OUTPUT)_config.bin -binary

$(OUTPUT).hex: $(ASMSRCS) $(OBJS)
	$(LD) $(LDFLAGS) -o $(OUTPUT) $(OBJS) crt0i.o libdev$(MCU).lib libsdcc.lib libio$(MCU).lib libc18f.lib

clean:
	rm -f *.o
	rm -f *.asm
	rm -f *.lst
	rm -f *.cod
	rm -f *.hex
	rm -f *.map
	rm -f *.bin
	rm -f usb/*.o
	rm -f usb/*.asm
	rm -f usb/*.lst
	rm -f dfu/*.o
	rm -f dfu/*.asm
	rm -f dfu/*.lst

%.asm : %.c
	$(CC) $(CFLAGS) $< -o $@

%.o : %.asm
	$(AS) $(ASFLAGS) -o $@ -c $<
