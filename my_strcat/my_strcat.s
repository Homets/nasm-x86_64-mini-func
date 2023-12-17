bits 64


global my_strcat


my_strcat:
	mov rax, 0
	mov rcx, 0
	mov r8, 0
	mov r9b, 0
	push rdi
	jmp loop_str_len
	
	

check_second_string:
	cmp [rsi + rcx], byte 0
	jz final_concat
	jmp concat


final_concat: 
	mov r8b, [rsi + rcx]
	mov [rdi + rcx], r8b
	pop rax
	ret


concat: ;concatenation de la string
	mov r8b, byte [rsi + rcx]
	mov  byte[rdi + rcx], r8b
	inc rcx
	jmp check_second_string


loop_str_len: ;passer la première string jusqu'au byte null
	cmp [rdi], byte 0
	jnz inc_rdi
	mov r9, [rsi]   ; overwrite null byte with first character
	mov [rdi], r9
	inc rcx
	jmp check_second_string


; to avoid the continuation of the function which modifies the end of the string
inc_rdi:
	inc rdi
	jmp loop_str_len
