.section .text

.global _start

_start:
    ldr r8, ='a'
    ldr r9, ='z'

    .Lread_loop_start:
    ldr r7, =0x900003
    mov r0, #0
    movw    r1, #:lower16:char
    movt    r1, #:upper16:char
    mov r2, #1 // Read exactly one char
    swi 0x900003

    // Error handling: if written bytes <= 0, we stop
    cmp r0, #0
    ble .Lread_loop_end

    // Now we can make this character uppercase if necessary
    LDRB r10, [r1]
    cmp r10, #'a'
    blt .Loutput
    cmp r10, #'z'
    bgt .Loutput

    // Now we know that it's in the range of a-z, so we should set the "32 bit" to zero
    and r10, #0b11011111

    STRB r10, [r1]

    .Loutput:
    ldr r7, =0x900004
    mov r0, #1 // Stdout
    movw    r1, #:lower16:char
    movt    r1, #:upper16:char
    mov r2, #1 // Write exactly one char
    swi 0x900004

    b .Lread_loop_start

    .Lread_loop_end:

    ldr r7, =0x900001
    mov r0, #0
    swi 0x900001


.section .data
char:
    .space 1
