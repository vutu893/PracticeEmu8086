;bai20:kiem tra tinh doi xung cua mot xau ki tu
.model small
.stack 100h
.data
    msg1 db 10, 13, 'Nhap xau: $'
    msg2 db 10, 13, 'Xau doi xung $'
    msg3 db 10, 13, 'Xau khong doi xung$'
    str db 255 dup('$')
    n db 0
    hai db 2
.code
MAIN Proc
    mov ax, @data
    mov ds, ax
    
    ;hien thi thong bao 1
    mov ah, 9
    lea dx, msg1
    int 21h
    
    ;nhap xau
    mov ah, 10
    lea dx, str
    int 21h
    
    ;kiem tra xau doi xung
    lea si, str + 2
    xor cx, cx
    mov cl, str + 1 
    xor dx, dx
    mov ax, cx
    div hai
    mov al, dl
loop_for:
    xor bx, bx
    mov bl, cl
    mov ah, [si + bx - 1]
    mov bl, n
    mov al, [si + bx]
    cmp al, ah
    jne khong_doi_xung
    inc n
    dec cx
    cmp n, dl
    jle loop_for
doi_xung:
    mov ah, 9
    lea dx, msg2
    int 21h
    jmp exit_programming
khong_doi_xung:
    mov ah, 9
    lea dx, msg3
    int 21h
    
exit_programming:
    mov ah, 4ch
    int 21h

MAIN Endp
END MAIN