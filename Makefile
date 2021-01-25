base:=${HOME}/opt/cross/bin
AS:=${base}/i686-elf-as
LD:=${base}/i686-elf-ld
QEMU:= qemu-system-i386

.PHONY=clean qemu
bootsect:linker.ld bootsect.o
	- ${LD} -T linker.ld bootsect.o -o bootsect
	- objcopy -O binary -j .text bootsect
bootsect.o:bootsect.S
	${AS} bootsect.S -o bootsect.o

clean:
	- rm -rf *.o
qemu:
	${QEMU} -boot a -fda bootsect