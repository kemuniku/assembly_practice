section .data
    fmt db "%d", 10, 0;  
    fmt_s db "%s", 0
    odd db "Odd",0
    even db "Even",0
    buffer db 128
section .text
    global main
    extern printf, scanf


main:
    ; プロローグ
    push rbp
    mov rbp, rsp
    sub rsp, 256

    ; a,bを受け取る
    lea rdi, [rel fmt]
    lea rsi, [rsp]
    call scanf WRT ..plt

    lea rdi, [rel fmt]
    lea rsi, [rsp+8]
    call scanf WRT ..plt

    ;a&bを計算する
    mov rax,[rsp]
    and rax,[rsp+8]

    ;(a&b) & 1を計算する
    and rax,1



    ;(a&b) & 1 == 0なら、その数は偶数である。
    jz even_print
    
    ;もし違うのなら、その数は奇数である
    lea rdi, [rel fmt_s]
    mov rsi, odd
    call printf WRT ..plt
    jmp end
even_print:
    lea rdi, [rel fmt_s]
    mov rsi, even
    call printf WRT ..plt
    jmp end

end:
    ; エピローグ
    mov eax, 0
    mov rsp,rbp
    pop rbp
    ret
