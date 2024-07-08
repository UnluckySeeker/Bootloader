OUTPUT_FORMAT(elf32-i386);

SECTIONS
{
    . = 0x7C00;

    .boot : AT(0x7C00) SUBALIGN(4)
    {
        boot.o(.text);
        boot.o(.*);
    }

    . = 0x7DFE;

    .bootsig :
    {
        SHORT(0xAA55);
    }

    .pm : AT(0x7E00) SUBALIGN(4)
    {
        pm.o(.text);
        pm.o(.*);
    }

    .entered : SUBALIGN(4)
    {
        entered.o(.text);
        entered.o(.*);
    }

    /DISCARD/ :
    {
        *(.eh_frame);
        *(.comment);
    }
}