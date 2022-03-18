.section .text

.global _start

_start:
    ldr r8, ='a'
    ldr r9, ='z'    

    movw    r0, #:lower16:alphabet
    movt    r0, #:upper16:alphabet

    // Move the entire alphabet to memory
    .Lalphabet_loop_start:
        STRB r8, [r0]
        add r8, #1


        add r0, #1
        cmp r8, r9
    ble .Lalphabet_loop_start

    // Now write the generated text to stdout
    ldr r7, =0x900004 // Write
    mov r0, #1        // Stdout
    movw    r1, #:lower16:alphabet
    movt    r1, #:upper16:alphabet
    mov r2, #27       // Length of alphabet + a newline
    swi 0x900004 

    // Exit code 0
    ldr r7, =0x900001
    mov r0, #0
    swi 0x900001


.section .data
alphabet:
    .space 26
    .asciz "\n"
