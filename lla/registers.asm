section .text
	global _start

_start:
	mov rdx, len
	mov rcx, msg
	mov rbx, 1
	mov rax, 4
	int 0x80

	mov rdx, 9
	mov rcx, s2
	mov rbx, 1
	mov rax, 4
	int 0x80

	mov rax, 1
	int 0x80

section .data
msg db 'Displaying 9 stars', 0xa
len equ $ - msg
s2 times 9 db '*'
