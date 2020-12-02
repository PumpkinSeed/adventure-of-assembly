section .data
	userMsg db 'Please enter a number: '
	lenUserMsg equ $-userMsg
	dispMsg db 'You have entered: '
	lenDispMsg equ $-dispMsg

section .bss
	num resb 5 ; 5-byte length variable

section .text
	global _start

_start:
	mov rax, 4
	mov rbx, 1
	mov rcx, userMsg
	mov rdx, lenUserMsg
	int 80h

	; Read and store the user input
	mov rax, 3
	mov rbx, 2
	mov rcx, num
	mov rdx, 5
	int 80h

	; Output the message
	mov rax, 4
	mov rbx, 1
	mov rcx, dispMsg
	mov rdx, lenDispMsg
	int 80h

	; Output the number entered
	mov rax, 4
	mov rbx, 1
	mov rcx, num
	mov rdx, 5
	int 80h

	mov rax, 1
	int 80h
