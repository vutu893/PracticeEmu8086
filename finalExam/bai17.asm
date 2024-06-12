;in thuong, in hoa mot chuoi va mix
.model small
.stack 100h
.data
    msg1 db 10, 13, 'Nhap chuoi: $'
    msg2 db 10, 13, 'Chuoi in hoa la: $'
    msg3 db 10, 13, 'Chuoi in thuong la: $'
    msg4 db 10, 13, 'Chuoi sau khi bien doi la: $'
    str db 255 dup('$')
    
.code
MAIN Proc
    mov ax, @data
    mov ds, ax
    
    ;hien thi thong bao 1
    lea dx, msg1
    call ngat_9
    
    ;nhap chuoi
    mov ah, 10
    lea dx, str
    int 21h

    call setup   
    ;in hoa
    lea dx, msg2
    call ngat_9
    call upper
    
    ;in thuong
    call setup
    lea dx, msg3
    call ngat_9
    call lower
    
    ;mix
    call setup
    lea dx, msg4
    call ngat_9
    call mix
    
exit_programing:
    mov ah, 4ch
    int 21h    
MAIN Endp 
    setup proc
        lea si, str + 2
        xor cx, cx
        mov cl, str + 1
        ret
    setup endp
    
    ngat_9 proc
        mov ah, 9
        int 21h
        ret
    ngat_9 endp
    
    upper proc
        loop_for1:
            mov dl, [si]
            cmp dl, 32
            je end_if1
            cmp dl, 'Z'
            jle end_if1
            sub dl, 32
        end_if1:
            mov ah, 2
            int 21h
            inc si
            loop loop_for1
        ret
    upper endp
    
    lower proc
        loop_for2:
            mov dl, [si] 
            cmp dl, 32
            je end_if2
            cmp dl, 'a'
            jge end_if2
            add dl, 32
        end_if2:
            mov ah, 2
            int 21h
            inc si
            loop loop_for2
        ret
    lower endp
    
    mix proc
        loop_for3:
            mov dl, [si]
            cmp dl, 32
            je endif
        if:
            cmp dl, 'a'
            jge convert_upper
        else:
            add dl, 32
            jmp endif
        convert_upper:
            sub dl, 32
        endif:
            mov ah, 2
            int 21h
            inc si
            loop loop_for3
        ret
    mix endp
    
END MAIN