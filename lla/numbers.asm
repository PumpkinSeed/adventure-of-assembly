section .text
	global _start

_start:
	; calc two 5-digit number
	mov esi, 4	; pointing to the rightmost digit
	mov ecx, 5  ; number of digits
	clc			; clear the carry flag

add_loop:
	mov al, [num1 + esi]
	adc al, [num2 + esi] ; add carry flag, so AL = AL + [num2 + esi] + CF
	aaa					 ; ASCII Adjust After Addition
	pushf				 ; push flags to the register
	or al, 30h
	popf

	mov [sum + esi], al
	dec esi
	loop add_loop

	mov edx, len
	mov ecx, msg
	mov ebx, 1
	mov eax, 4
	int 0x80

	mov edx, 5
	mov ecx, sum
	mov ebx, 1
	mov eax, 4
	int 0x80

	mov eax, 1
	int 0x80

section .data
msg db 'The Sum is:', 0xa
len equ $ - msg
num1 db '12345'
num2 db '23456'
sum db '     '
