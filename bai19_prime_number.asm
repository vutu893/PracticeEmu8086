;bai19: kiem tra mot so co phai so nguyen to hay khong: nhap so > 2
.model small
.stack 100h
.data
    msg1 db 10, 13, 'nhap so: $'
    msg2 db 10, 13, 'La so nguyen to $'
    msg3 db 10, 13, 'Khong la so nguyen to$'
    str db 256 dup('$')
    var dw 0
    count dw 0
.code
MAIN Proc
    mov ax, @data
    mov ds, ax
    
start:;hien thi thong bao 1
    mov ah, 9
    lea dx, msg1
    int 21h
    
    ;nhap so
    mov ah, 10
    lea dx, str
    int 21h
    
    ;convert string to int
    xor cx, cx
    xor dx, dx
    xor bx, bx
    lea si, str + 2
    mov cl, str + 1
    call convert_string_to_int
    
    mov var, bx
    
    ;check prime number
    mov cx, var
    sub cx, 1
loop_check:
    mov ax, var
    xor dx, dx    
    div cx
    cmp dx, 0
    je increasing_count
    dec cx
    cmp cx, 2
    jg loop_check
    
exit_loop:       
    call is_prime
    jmp exit_programing
      
increasing_count:
   add count, 1
   cmp count, 0
   jg result_check 
   dec cx
   cmp cx,1
   je exit_loop
   jmp loop_check
    
result_check:
    call no_prime
    

exit_programing:
    mov ah, 4ch
    int 21h    
MAIN Endp
    convert_string_to_int proc
        loop_for:
            xor ax, ax
            mov al, 10
            mul bx
            mov dl, [si]
            sub dl, '0'
            add ax, dx
            inc si
            mov bx, ax
            loop loop_for
        ret
    no_prime proc
        mov ah, 9
        lea dx, msg3
        int 21h
        ret
    no_prime endp
    
    is_prime proc
        mov ah, 9
        lea dx, msg2
        int 21h
        ret
    is_prime endp
    
   
END MAIN