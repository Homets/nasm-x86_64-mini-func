bits 64

global _atoi


section .text
  _atoi:
    ;prologue
    push ebp,
    mov rbp, rsp
    
    xor rcx, rcx ;rcx will be my integer length counter
    xor r9, r9 ;r( will be my counter to add the char value to the string (use to not loose the pointer to the string debut)

    mov rax, rdi ;move the integer to rax for the division
    mov rbx, 10 ;used for divide
    jmp transform
  
  _transform:
    xor rdx, rdx ; reset rdx to store new remainder
    div  rbx ;get the new character after
    add rdx, 48 ;add #48 to get ascii number
    push rdx
    inc rcx ;+1 to number lemgth 
    cmp 0, rax ;
    jz _get_value
    jmp _transform  


  _get_value:
    pop [rdi + r9] ;put the character ascii code to to rdi right index
    inc r9 
    dec rcx
    cmp 0, rcx 
    jz _end
    jmp _get_value

  _end:
    ;epilogue
    mov rsp, rbp
    pop rbp
    ret
