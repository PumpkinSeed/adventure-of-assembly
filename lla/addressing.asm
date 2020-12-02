section .text
	global _start

_start:

	mov rdx, 9
	mov rcx, name
	mov rbx, 1
	mov rax, 4
	int 0x80

	mov [name], dword 'Nuha' ; Changed the name to Nuha Ali

	mov rdx, 8
	mov rcx, name
	mov rbx, 1
	mov rax, 4
	int 0x80

	mov rax, 1
	int 0x80

section .data
name db 'Zara Ali'

