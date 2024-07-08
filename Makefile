all:
	as boot.s -o boot.o --32
	as pm.s -o pm.o --32
	as entered.s -o entered.o --32
	ld -T boot.ld -melf_i386 -o boot.elf boot.o pm.o entered.o
	objcopy -O binary boot.elf boot.bin