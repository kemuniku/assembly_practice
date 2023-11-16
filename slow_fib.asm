section .data
    fmt db "%d", 10, 0  ;  

section .text
    global main
    extern printf

main:
    ; プロローグ
    sub rsp, 8
    
    ; フィボナッチ数列の45番目を計算する
    mov rdi, 45
    call fib

    ; 結果を出力
    lea rdi, [rel fmt]
    mov rsi, rax
    call printf WRT ..plt

    ; エピローグ
    add rsp, 8
    mov rax, 0
    ret

fib:
    ;x <= 2のとき、1を返す
    cmp rdi, 2
    jbe fib_1
    
    ;x > 2のとき
    sub rdi,1
    call fib ;fib(x-1)
    add rdi,1

    push rax ;結果を保存

    sub rdi,2
    call fib
    add rdi,2
    
    pop rdx
    add rax,rdx
    ret

fib_1:
    mov rax, 1
    ret