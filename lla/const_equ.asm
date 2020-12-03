SYS_EXIT	equ 1
SYS_WRITE	equ 4
STDIN		equ 0
STDOUT		equ 1

section .text
	global _start

_start:
	mov rax, SYS_WRITE
	mov rbx, STDOUT
	mov rcx, msg1
	mov rdx, len1
	int 0x80

	mov rax, SYS_WRITE         
	mov rbx, STDOUT         
	mov rcx, msg2         
	mov rdx, len2 
	int 0x80 
	
	mov rax, SYS_WRITE         
	mov rbx, STDOUT         
	mov rcx, msg3         
	mov rdx, len3 
	int 0x80

	mov rax, SYS_EXIT
	int 0x80

section .data
msg1 db 'Hello, programmers!',0xA,0xD
len1 equ $ - msg1

msg2 db 'Welcome to the world of,',0xA,0xD
len2 equ $ - msg2

msg3 db 'Linux assembly programming! '
len3 equ $ - msg3
