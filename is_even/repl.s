bits 64

;is function will create a classical repl for polish notation arithnetic operation
;repl stand for "read evalute input loop", its a infinite loop for takin input create output

section .text
global _start


_start:
  xor rax, rax
  xor rdi, rdi
  xor rsi, rsi

_loop: ;loop is first in codebase because this is the while loop the first thing to come in repl

_read:
  div rdi, 2
  cmp rdi
  jz even
  mov rax, 0
  jmp _end

_evaluate:


_print:

_end:

  ;epilogue
  mov esp, ebp
  pop ebp

section .data








