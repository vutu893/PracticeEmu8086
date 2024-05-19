;bai11: chuyen tu chuoi ve so cua hai loai 8bit: tu 0 den 255
.model small
.stack 100h
.data
    msg1 db 10, 13, 'nhap chuoi: $'
    msg2 db 10, 13, 'chuyen chuoi thanh so...$'
    msg3 db 10, 13, 'so 8 bit thu duoc la: $'
    str db 256 dup('$')
    result dw 0
    muoi dw 10
.code
MAIN Proc
    mov ax, @data
    mov ds, ax
    
    ;hien thi thong bao 1
    mov ah, 9
    lea dx, msg1
    int 21h
    
    ;nhap chuoi so
    mov ah, 10
    lea dx, str
    int 21h
    
    ;hien thi thong bao 2 va 3
    mov ah, 9
    lea dx, msg2 
    int 21h
    
    lea dx, msg3
    int 21h
    
    ;in ra so 
    xor cx, cx
    lea si, str + 2
    mov cl, str + 1
    xor dx, dx
    loop_for:
        xor ax, ax
        mov al, 10
        mul result
        mov dl, [si]
        sub dl, '0'
        add ax, dx
        mov result, ax
        inc si
        loop loop_for 
    
    ;hien thi ra ket qua 
    call hienthi
    exitprograming:
        mov ah, 4ch
        int 21h
    
MAIN Endp
    hienthi proc
           xor ax, ax
           mov ax, result
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
    hienthi endp
END MAIN 
    