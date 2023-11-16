section .data
    fmt db "%d", 10, 0;  
    fmt_s db "%s", 0
section .text
    global main
    extern printf, scanf

main:
    ; プロローグ
    push rbp
    mov rbp, rsp
    sub rsp, 256

    ; a,b,cを受け取る
    lea rdi, [rel fmt]
    lea rsi, [rsp]
    call scanf WRT ..plt

    lea rdi, [rel fmt]
    lea rsi, [rsp+8]
    call scanf WRT ..plt

    lea rdi, [rel fmt]
    lea rsi, [rsp+16]
    call scanf WRT ..plt

    ;a+b+cを計算する
    mov rax,[rsp]
    add rax,[rsp+8]
    add rax,[rsp+16]

    ; a+b+cを出力
    lea rdi, [rel fmt]
    mov rsi, rax
    call printf WRT ..plt

    ; 文字列を受け取る
    lea rdi, [rel fmt_s]
    lea rsi, [rsp]  ; スタック上に確保した領域を指定
    call scanf WRT ..plt

    ; 受け取った文字列を出力
    lea rdi, [rel fmt_s]  ; スタック上に確保した領域を指定
    lea rsi, [rsp]
    call printf WRT ..plt

    ; エピローグ
    mov eax, 0
    mov rsp,rbp
    pop rbp
    ret
