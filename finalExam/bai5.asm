;bai5: nhap vao 1 day bit roi chuyen sang he thap phan va hex
.model small
.stack 100h
.data
    msg1 db 10, 13, 'Enter a binary: $'
    msg2 db 10, 13, '>>>> Result decimary: $'
    msg3 db 10, 13, '>>>> Result hexa: $'
    str db 256 dup('$')
    count db 8
    sum db 0
    hai db 2 
    muoi dw 10
.code
MAIN Proc
    mov ax, @data
    mov ds, ax
    
    ;hien thi thong bao 1
    mov ah, 9
    lea dx, msg1
    int 21h
    
    ;nhap chuoi
    mov ah, 10
    lea dx, str
    int 21h
    
    lea si, str + 2
    mov bx, 0000h
    xor cx, cx
    mov cl, str + 1
    
loop_deci:
    xor dx, dx
    mov dl, [si + bx]
    sub dl, '0'
    cmp dl, 0
    je khong
    cmp dl, 1
    je mot
khong:
    inc bx
    dec count           
    dec cx
    cmp cx, 0
    jne loop_deci
    jmp result
mot:
    inc bx
    xor ax, ax
    mov ax, 0001h
    mov count, cl
    sub count, 1
loop_luy_thua:
    mul hai
    dec count
    cmp count, 0
    jne loop_luy_thua
    
    add sum, 1
    add sum, al
    dec cx
    
    cmp cx, 0
    jne loop_deci
    
result:    ;hien thi ket qua
    mov ah, 9
    lea dx, msg2
    int 21h
    
    xor ax, ax
    mov al, sum
    call print_result
exit_programing:    
    mov ah, 4ch
    int 21h
    
MAIN Endp
    print_result proc
        xor cx, cx
        loop_push:
            xor dx, dx
            div muoi
            add dx, '0'
            push dx
            inc cx
            cmp ax, 0
            jne loop_push
        print:
            pop dx
            mov ah, 2
            int 21h
            loop print
        ret
    print_result endp
END MAIN