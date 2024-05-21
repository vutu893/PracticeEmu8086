;bai15: int convert to hex
.model small
.stack 100h
.data
    msg1 db 10, 13, 'nhap so: $'
    msg2 db 10, 13, 'so o he thap luc phan la: $'
    str db 256 dup('$')
    var dw ?
.code
MAIN Proc
    mov ax, @data
    mov ds, ax
    
    mov dx, 'H'
    push dx
    
    ;hien thi thong bao 1
    mov ah, 9
    lea dx, msg1
    int 21h
    
    ;nhap so
    mov ah, 10
    lea dx, str
    int 21h
    
    ;chuyen doi chuoi thanh so
    xor bx, bx
    xor cx, cx
    lea si, str + 2
    mov cl, str + 1
    xor dx, dx  
    
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
    
    ;thuc hien chuyen thi he thap phan sang he thap luc phan
    mov var, bx
    mov ax, var
    mov bx, 0010h
loop_divive:
    xor dx, dx
    div bx
    cmp dx,10
    jge tang
    add dx, '0'
    push dx 
    inc cx
check:
    cmp ax, 0
    jne loop_divive
    jmp end_loop
tang:
    add dx, 55
    push dx
    inc cx
    jmp check
    
end_loop:    ;hien thi thong bao 2
    mov ah, 9
    lea dx, msg2
    int 21h 
printresult:
    pop dx
    mov ah, 2
    int 21h
    cmp dx, 'H'
    jne printresult
exitprogramming:
    mov ah, 4ch
    int 21h
        
MAIN Endp
END MAIN