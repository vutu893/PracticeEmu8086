;bai 12: tinh tong cua hai so voi gia tri bieu dien tu 0 --> 2mu15
;suy ra de khong bi tran so thi nhap vao hai so khong qua 2mu14
.model small
.stack 100h
.data
    msg1 db 10, 13, 'nhap so thu nhat: $'
    msg2 db 10, 13, 'nhap so thu hai: $'
    msg3 db 10, 13, 'tong cua hai so la: $'
    str1 db 256 dup('$')
    str2 db 256 dup('$')
    var1 dw 0
    var2 dw 0
    muoi dw 10
.code
MAIN Proc
    mov ax, @data
    mov ds, ax
    
    ;hien thi thong bao 1
    lea dx, msg1
    call inmanhinh
    
    ;nhap so thu nhat
    lea dx, str1
    call nhapso
    
    ;hien thi thong bao 2
    lea dx, msg2
    call inmanhinh
                  
    ;nhap so thu hai
    lea dx, str2
    call nhapso
    ;hien thi thong bao 3
    lea dx, msg3
    call inmanhinh
    
    ;convert bien thu nhat sang int
    xor bx, bx
    lea si, str1 + 2
    xor cx, cx
    mov cl, str1 + 1
    xor dx, dx
    call convertstringtoint
    mov var1, bx
    
    ;convert bien thu hai sang int
    xor bx, bx
    lea si, str2 + 2
    mov cl, str2 + 1
    xor dx, dx
    call convertstringtoint
    mov var2, bx
    
    xor ax, ax
    mov ax, var1
    add ax, var2
    
    call printresult
    exitprograming:
        mov ah, 4ch
        int 21h
    
MAIN Endp
    inmanhinh proc
        mov ah, 9
        int 21h
        ret
    inmanhinh endp
    
    nhapso proc
        mov ah, 10
        int 21h
        ret
    nhapso endp
    
    convertstringtoint proc
        loop_for:
            xor ax, ax
            mov al, 10
            mul bx
            mov dl, [si]
            sub dl, '0'
            add ax, dx
            mov bx, ax
            inc si
            loop loop_for
        ret    
    convertstringtoint endp
    
    printresult proc
        xor cx, cx
        
        loop_for1:
            xor dx, dx
            div muoi
            add dl, '0'
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
 