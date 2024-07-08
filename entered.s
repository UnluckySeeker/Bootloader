.text
.intel_syntax noprefix
.global _entered_pm

_entered_pm:
mov ah, 0x0e
mov al, 'P'
int 0x10
cli
ret