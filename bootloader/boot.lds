MEMORY
{
    IRAM (rwx)  : ORIGIN = 0x402F0400, l = 0x1FBFF /* 127k Internal Ram */
}

OUTPUT_FORMAT("elf32-littlearm", "elf32-littlearm", "elf32-littlearm")
OUTPUT_ARCH(arm)

STACK_SIZE = 0x800; /* 2KB */

SECTIONS
{
    .vector :
    {
        . = ALIGN(4);
        *init.o (.text)
    } > IRAM

    .text :
    {
        . = ALIGN(4);
        *(.text*)
    } > IRAM

    .data :
    {
        . = ALIGN(4);
        *(.data*)
    } > IRAM

    .bss (NOLOAD) :
    {
        . = ALIGN(4);
        _bss_start = .;
        *(.bss*)
        *(COMMON)
        _bss_end = .;
    } > IRAM

    .stack (NOLOAD) :
    {
        . = ALIGN(8);
        __StackLimit = .;
        *(.stack*)
        . = . + STACK_SIZE;
        __StackTop = .;
    } > IRAM

    _stack = __StackTop;
}