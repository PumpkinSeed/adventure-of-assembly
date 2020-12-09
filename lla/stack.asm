section .text
	global _start

_start:
	call display
	mov rax, 1
	int 0x80

display:
	mov rcx, 256

next:
	push rcx
	mov rax, 4
	mov rbx, 1
	mov rcx, achar
	mov rdx, 1
	int 80h

	pop rcx
	mov dx, [achar]
	cmp byte [achar], 0dh
	inc byte [achar]
	loop next
	ret

section .data
achar db '0'
