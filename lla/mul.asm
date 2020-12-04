section .text
	global _start

_start:
	mov al, '3'
	sub al, '0'

	mov bl, '2'
	sub bl, '0'
	mul bl		; multiply al with bl
	add al, '0'

	mov [res], al
	mov rcx, msg
	mov rdx, len
	mov rbx, 1
	mov rax, 4
	int 0x80

	mov rcx, res
	mov rdx, 1
	mov rbx, 1
	mov rax, 4
	int 0x80

	mov rax, 1
	int 0x80

section .data
msg db "The result is: ", 0xA, 0xD
len equ $ - msg

segment .bss
res resb 1
