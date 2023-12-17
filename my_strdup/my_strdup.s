bits 64

;rcx => counter length of base string
;rsi => counter length of copy for comparaison "if rsi < rcx then"
global my_strdup
default rel
extern malloc
extern free

section .text

; man strdup
my_strdup:
	push rbp
	mov rbp,rsp
	mov rsi, 0
	mov rcx, 0 
	cmp [rdi], byte 0 ;check empty string
	;jz end
	jmp _get_strlen


_get_strlen:
	
	cmp [rdi + rcx], byte 0 ; count len
	jz _alloc
	inc rcx
	jmp _get_strlen


_alloc:	
	inc rcx
	push rcx
	push rdi
	mov rdi,rcx
	call malloc wrt ..plt	
	cmp rax, 0			
  jle _error_malloc
	pop rdi				
	pop rsi
	;mov rsi,rcx			
	xor rcx,rcx	
	jmp _strcopy


_strcopy:
	cmp rcx, rsi
	je _end
	mov r8b, [rdi + rcx]
	mov  [rax + rcx], r8b
	inc rcx
	jmp _strcopy

_end:
	mov rsp,rbp
	pop rbp
	ret
_error_malloc:
	mov rax, 1
	mov rsp,rbp
	pop rbp
	ret


