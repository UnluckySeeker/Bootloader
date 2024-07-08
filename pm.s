.code16
.intel_syntax noprefix
.text
.extern _entered_pm

_pm_start:
mov bx, offset hello_world
mov ah, 0x0e
mov cx, [hello_world_sz]
print:
mov al, [bx]
int 0x10
inc bx
dec cx
cmp cx, 0
jne print
cli
hlt

hello_world:
.ascii "Hello World!"
hello_world_sz:
.word . - hello_world
