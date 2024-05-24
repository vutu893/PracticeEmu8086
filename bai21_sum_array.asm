;bai21: nhap 1 mang roi tinh tong cua mang
.model small
.stack 100h
.data
    msg1 db 10, 13, 'so phan tu cua mang la: $'
    msg2 db 10, 13, 'nhap mang: $'
    msg3 db 10, 13, 'tong cua mang da nhap la: $'
    space db 32, '$'
    n db ?
    ;thieu dup se bi sai ket qua
    arr db 100 dup(?)  
    sum dw 0
    muoi dw 10
.code
MAIN Proc
    mov ax, @data
    mov ds, ax
    
    ;hien thi thong bao 1
    mov ah, 9
    lea dx, msg1
    int 21h
    
    ;nhap n
    mov ah, 1
    int 21h
    sub al,'0'
    mov n, al
    
    ;hien thi thong bao nhap mang
    mov ah, 9
    lea dx, msg2
    int 21h
    
    ;nhap mang va tinh tong
    xor cx, cx
    mov cl, n
    lea si, arr
loop_for:
    xor bx, bx
    call input
    sub al, '0'    
    mov [si], al
    mov bl, al
    add sum, bx
    ;mov bl, al ;sum tang o buoc nay ?==> phai tinh tong o mot vong lap khac
    ;add sum, bx
    inc si
    call space_ele
    loop loop_for
    
    ;hien thi ket qua
    mov ah, 9
    lea dx, msg3
    int 21h
    
    ;tinh tong
    mov ax, sum
    call printresult
exit_programing:
    mov ah, 4ch
    int 21h
MAIN Endp
    input proc
        mov ah, 1
        int 21h
        ret
    input endp
    
    space_ele proc
        mov ah, 9
        lea dx, space
        int 21h
        ret
    space_ele endp
    
    printresult proc
        xor cx, cx
        loop_for1:
            xor dx, dx
            div muoi
            add dx, '0'
            push dx
            inc cx
            cmp ax, 0
            jne loop_for1
        print:
            pop dx
            mov ah, 2
            int 21h
            loop print
         ret 
    printresult endp
END MAIN