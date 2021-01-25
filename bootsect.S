.code16

.global _start
.equ BOOTSEG, 0x07c0

.text
ljmp $BOOTSEG, $_start
_start:
    mov $0x03, %ah
    int $0x10


    mov $BOOTSEG, %ax
    mov %ax, %es
    mov $message, %bp

    mov $0x1301, %ax
    mov $0x0b, %bx
    mov $13, %cx
    int $0x10

lo: jmp lo

message:
    .ascii "Hello World"
    .byte 13, 10
.= 510
.word 0xaa55
