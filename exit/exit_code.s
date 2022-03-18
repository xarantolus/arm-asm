.section .text

.global _start

_start:
    ldr r7, =0x900001
    mov r0, #13
    swi 0x900001
