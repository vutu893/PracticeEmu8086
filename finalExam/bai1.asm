;bai1: tinh tong cac chu so chan trong mot so 
.model small
.stack 100h
.data
    msg1 db 10, 13, 'nhap so: $'
    msg2 db 10, 13, 'tong cac chu so chan la: $'
    str db 256 dup('$')
    muoi dw 10
    sum dw 0
.code
MAIN Proc
    mov ax, @data
    mov ds, ax
    
    ;hien thi thong bao 1
    mov ah, 9
    lea dx, msg1
    int 21h
    
    ;nhap so
    mov ah, 10
    lea dx, str
    int 21h
    
    ;hien thi ket qua
    mov ah, 9
    lea dx, msg2
    int 21h
    
    ;solve
    call convert_str_to_number
    mov ax, bx
    
    call sum_even_number
    
    call printresult
exit_programing:    
    mov ah, 4ch
    int 21h
    
MAIN Endp
    convert_str_to_number proc
        xor bx, bx
        xor dx, dx
        lea si, str + 2
        xor cx, cx
        mov cl, str + 1
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
    convert_str_to_number endp
    
    sum_even_number proc 
        loop_for1:
            xor dx, dx
            div muoi
            test dx, 0001h
            jz creasing
            cmp ax, 0
            jne loop_for1
            jmp exit
         creasing:
            add sum, dx
            cmp ax, 0
            jne loop_for1
         exit:   
        ret
    sum_even_number endp
    
    printresult proc
        mov ax, sum
        xor cx,cx
        loop_for3:
          xor dx, dx
          div muoi
          add dx, '0'
          push dx
          inc cx
          cmp ax, 0
          jne loop_for3
        print:
           pop dx
           mov ah, 2
           int 21h
           loop print
        ret
   printresult endp  
            
END MAIN