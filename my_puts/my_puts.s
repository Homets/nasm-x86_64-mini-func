bits 64

section .data
	backslash db 10
	null_str db '(null)', 10

section .text
global my_puts


my_puts:
	cmp rdi, 0
	jz return_null
	mov r8, 0
	mov r9, rdi
	jmp get_len


get_len:
	cmp [rdi + r8], byte 0
	jz write_func
	inc r8
	jmp get_len


write_func:
	mov rax, 1 	;call system for write
	mov rdi, 1 	; file handle => stdout
	mov rsi, r9	; adress of string to output 
	mov rdx, r8	;number of bytes
	syscall 	;syscall

	mov rax, 1
	mov rdi, 1
	mov rsi, backslash
	mov rdx, 1
	syscall
	
	ret


return_null:
	mov rax, 1
	mov rdi, 1
	mov rsi, null_str
	mov rdx, 7
	syscall
	ret
