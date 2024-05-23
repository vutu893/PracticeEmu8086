;bai17: thi ma hex chuyen sang he thap phan: chuyen sang nhi phan roi sang thap phan
.model small
.stack 100h
.data
    msg1 db 10, 13, 'nhap chuoi hex: $'
    msg2 db 10, 13, 'gia tri o he nhi phan la: $' 
    msg3 db 10, 13, 'gia tri o he thap phan la: $'
    str db 256 dup('$')
    var dw 0
    muoi dw 10
    hai dw 2
.code
MAIN Proc
    mov ax, @data
    mov ds, ax
    
    ;hien thi thong bao 1
    mov ah, 9
    lea dx, msg1
    int 21h
    
    ;nhap chuoi hex
    mov ah, 10
    lea dx, str
    int 21h
    
    ;hien thi thong bao 2
    mov ah, 9
    lea dx, msg2
    int 21h
    
    ;thuc hien chuyen doi hex sang nhi phan
    lea si, str + 2
    xor cx, cx
    mov cl, str + 1
    xor bx, bx
    mov bx, cx 
    
loop_for:
    mov ax, [si]
    inc si 
    mov ah, 0
    cmp al, '9'
    jle number
    cmp al, 'A'
    jge char 
    
number:
    sub al,'0'
    jmp end_if
    
char: 
    sub al, 55
    jmp end_if
    
end_if:
    dec bx
    call convert_int_to_binary
    cmp bx, 0
    jne loop_for
    
exitprograming:
    mov ah, 4ch
    int 21h    
    
MAIN Endp
    hienthi proc
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
   hienthi endp   
    
   convert_int_to_binary proc 
        xor cx, cx
        mov var, ax
        
        loop_for2:
            xor dx, dx
            div hai
            push dx
            inc cx
            cmp ax, 0
            jne loop_for2
        mov ax, var
        
        cmp ax, 8
        jl push_khong
        
        end_if1:
        jmp print_binary
        
        push_khong:
            mov dx, 0
            push dx
            inc cx
            
        print_binary:
            pop dx
            add dx, '0'
            mov ah, 2
            int 21h
            loop print_binary   
        ret
   convert_int_to_binary endp
END MAIN