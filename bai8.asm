;bai8: dem so ki tu in hoa va in thuong
.model small
.stack 100h
.data
    msg1 db 10, 13,'nhap ki tu: $'
    msg2 db 10, 13, 'so ki tu in hoa la: $'
    msg3 db 10, 13, 'nhung ki tu in hoa trong xau ki tu la: $'
    msg4 db 10, 13, 'so ki tu in thuong la: $'
    msg5 db 10, 13, 'nhung ki tu in thuong trong xau ki tu la: $'
    muoi dw 10
    str db 256 dup('$'>
    countupper db ?
    countlower db ?
.code
MAIN Proc
    mov ax, @data
    mov ds, ax
    
    ;hien thi thong bao 1
    mov ah, 9
    lea dx, msg1
    int 21h
    
    ;nhap ki tu
    mov ah, 10
    lea dx, str
    int 21h
    
    xor dx, dx
    mov cl, str + 1 
    lea si, str +2
    xor ax, ax
    lap:
        inc dl
        cmp dl, cl
        jg thoatlap 
        mov bl,[si]
        cmp bl, 'a'
        jge increasinglower
        cmp bl, 'Z'
        jle increasingupper
    increasinglower:
        inc al
        inc si
        cmp dl, cl
        jle lap
        
    increasingupper:
        inc ah
        inc si
        cmp dl, cl
        jle lap
    thoatlap:
        mov countupper, ah
        mov countlower, al
        mov ah, 9
        lea dx, msg2
        int 21h
        
        xor ax, ax
        mov al, countupper
        call hienthi
        
        mov ah, 9
        lea dx, msg4
        int 21h
        
        xor ax, ax
        mov al, countlower
        call hienthi
        
     exit:
        mov ah, 4ch
        int 21h 
    
MAIN Endp
    hienthi proc
        xor cx, cx 
        mov bx, 10
        lappush:
          mov dx, 0
          div bx
          add dx, '0'
          push dx
          inc cx
          cmp ax,0
          jne lappush
        result:
          pop dx
          mov ah, 2
          int 21h
          loop result
        ret  
    hienthi endp
END MAIN