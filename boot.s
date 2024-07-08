.code16
.intel_syntax noprefix
.text

_start:
mov sp, 0x7C00

xor ah, ah
int 0x13

xor ax, ax
mov es, ax
mov bx, 0x7E00
mov ah, 0x02
mov al, 15
mov ch, 0
mov cl, 2
mov dh, 0
int 0x13
jc disk_error

mov bx, 0x7E00
jmp bx

cli
hlt

disk_error:
push offset disk_error_message
push [disk_error_message_sz]
call print_text
cli
hlt

invalid_sig_error:
push offset invalid_sig
push [invalid_sig_sz]
call print_text
cli
hlt

print_text:
push bp

mov bp, sp

mov ah, 0x0e

mov cx, [bp+4]
mov bx, [bp+6]
dec bx

.print_text_loop:
mov al, byte [bx]
int 0x10
inc bx
dec cx
cmp cx, 0
jne .print_text_loop

pop bx

ret

disk_error_message:
.ascii "Failed to read bootloader!"
disk_error_message_sz:
.word . - disk_error_message
invalid_sig:
.ascii "Invalid bootloader signature!"
invalid_sig_sz:
.word . - invalid_sig
