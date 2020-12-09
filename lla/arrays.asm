section .text
	global _start

_start:
	mov eax, 3 ; number bytes to be summed
	mov ebx, 0 ; EBX will store the sum
	mov ecx, x ; ECX will point to the current element

top:
	add ebx, [ecx] ; add ECX current element to the EBX
	add ecx, 1	   ; move pointer to the next element
	dec eax		   ; decrement counter
	jnz top		   ; if counter not 0, then loop again

done:
	add ebx, '0'
	mov [sum], ebx ; store the result in "sum"

display:
	mov edx, 1
	mov ecx, sum
	mov ebx, 1
	mov eax, 4
	int 0x80

	mov eax, 1
	int 0x80

section .data
global x
x:
	db 2
	db 3
	db 4

sum:
	db 0
