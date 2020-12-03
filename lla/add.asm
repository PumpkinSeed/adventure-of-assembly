SYS_EXIT	equ 1
SYS_READ	equ 3
SYS_WRITE	equ 4
STDIN		equ 0
STDOUT		equ 1

segment .data
	msg1 db "Enter a digit: ", 0xA, 0xD
	len1 equ $ - msg1

	msg2 db "Please enter a second digit: ", 0xA, 0xD
	len2 equ $ - msg2

	msg3 db "The sum is: ", 0xA, 0xD
	len3 equ $ - msg3

segment .bss
	num1 resb 2
	num2 resb 2
	res resb 1

section .text
	global _start

_start:
	mov rax, SYS_WRITE
	mov rbx, STDOUT
	mov rcx, msg1
	mov rdx, len1
	int 0x80

	mov rax, SYS_READ
	mov rbx, STDIN
	mov rcx, num1
	mov rdx, 2
	int 0x80

	mov rax, SYS_WRITE
	mov rbx, STDOUT
	mov rcx, msg2
	mov rdx, len2
	int 0x80

	mov rax, SYS_READ
	mov rbx, STDIN
	mov rcx, num2
	mov rdx, 2
	int 0x80

	mov rax, SYS_WRITE
	mov rbx, STDOUT
	mov rcx, msg3
	mov rdx, len3
	int 0x80

	; moving the first number to eax register and second number to ebx
	; and subtracting ascii '0' to convert it into a decimal number

	mov rax, [num1]
	sub rax, '0'

	mov rbx, [num2]
	sub rbx, '0'

	add rax, rbx ; add rax and rbx
	add rax, '0' ; add '0' to convert the sum from decimal to ASCII

	mov [res], rax ; storing the sum in memory location res

	mov rax, SYS_WRITE
	mov rbx, STDOUT
	mov rcx, res
	mov rdx, 1
	int 0x80

exit:
	mov rax, SYS_EXIT
	xor rbx, rbx
	int 0x80
