; dynamic memory allocation
section .text
	global _start

_start:
	mov eax, 45  ; sys_brk
	xor ebx, ebx
	int 0x80

	add eax, 16384 ; number of bytes to be reserved
	mov ebx, eax
	mov eax, 45    ; sys_brk
	int 0x80

	cmp eax, 0
	jl exit        ; exit if error
	mov edi, eax   ; EDI = highest available address
	sub edi, 4     ; pointing to the last DWORD
	mov ecx, 4096  ; number of DWORDs allocated
	xor eax, eax   ; clear eax
	std            ; backward, set direction flag
	rep stosd      ; repeate for entire allocated area
	cld			   ; put DF flag to normal state

	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, len
	int 0x80

exit:
	mov eax, 1
	xor ebx, ebx
	int 0x80

section .data
msg db "Allocated 16 kb of memory!", 10
len equ $ - msg


