bits 64

section .text
global my_strrev


my_strrev:

       push rbp           
       mov rbp, rsp

        mov rax, 0
        mov rcx, 0
        mov rdx, 0
        mov r8, 0
        mov r9, 0
        
        jmp .get_strlen

.get_strlen:
        cmp [rdi + rcx], byte 0
        
        je .divide_string
        ;je end
        inc rcx
        mov r11,rcx
        jmp .get_strlen


.divide_string:
        mov rax,rcx
        mov rbx, rcx
        push 2
        div dword [rsp]
        mov rcx,0
        mov r10,rbx
        jmp .reverse_count


.reverse_count:
        cmp rcx, rax
        je .end
        mov rbx,r10
        sub rbx,rcx
        sub rbx,1
        mov r8b, byte[rdi + rcx]
        mov r9b, byte[rdi + rbx]
        mov [rdi + rcx], r9b
        mov [rdi + rbx], r8b
        inc rcx
        jmp .reverse_count


.end:
    mov rax,rdi

        mov rsp, rbp
        pop rbp

        pop rcx
        jmp rcx
