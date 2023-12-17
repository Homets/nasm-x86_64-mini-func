bits 64


global my_fillstruct

my_fillstruct:

	push rbp
	mov rbp,rsp
	sub rsp, 8

	mov qword [rdi], rsi	;mov the int64_t

	movsd qword [rsp], xmm0
	fld qword [rsp]		;move the double in float register xmm0 to FPU Stack (st0)
	fst qword [rdi + 8]	;move the double in the FPU Stack to the double value in the structure passed in first arguement
	jmp _end
	


_end:
	mov rsp, rbp
	pop rbp
	ret
