;bai24:nhap vao mot tu 0 -> 9 roi doi cho cac vi tri theo yeu cau
.model small
.stack 100h
.data
    msg1 db 10, 13, 'nhap so phan tu cua mang: $'
    msg2 db 10, 13, 'nhap mang: $'
    msg3 db 10, 13, 'hai vi tri muon doi: $'
    msg4 db 10, 13, 'mang sau khi doi vi tri la: $'
    space db 32, '$'
    arr db 100 dup(?)
    n db  ?
    tmp db ?
.code
MAIN Proc
    
    mov ax, @data
    mov ds, ax
    
    ;hien thi thong bao 1
    mov ah, 9
    lea dx, msg1
    int 21h
    
    ;nhap so phan tu
    mov ah, 1
    int 21h
    sub al, '0'
    mov n, al
    
    ;hien thi thong bao 2
    mov ah, 9
    lea dx, msg2
    int 21h
    
    xor cx, cx
    mov cl, n
    lea si, arr
    
input_ele:
    mov ah, 1
    int 21h
    mov [si], al
    inc si        
    call space_ele
    loop input_ele
    
    ;hien thi thong bao 3
    mov ah, 9
    lea dx, msg3
    int 21h
    mov cx, 2
position_swap:
    mov ah, 1
    int 21h
    sub al, '0'
    xor dx, dx
    mov dl, al
    push dx 
    call space_ele
    loop position_swap
    
      
    lea si, arr 
    
swap:
    xor bx, bx
    pop dx
    mov tmp, dl
    mov bx, dx
    mov al, [si + bx]
    pop dx
    mov bx, dx
    mov ah, [si + bx]
    xchg al, [si + bx]
    xor bx, bx
    mov bl, tmp
    xchg ah, [si + bx]
    
    xor cx, cx
    mov cl, n 
    
    ;hien thi thong bao4
    mov ah, 9
    lea dx, msg4
    int 21h
print_array:
    mov dl, [si]
    inc si
    mov ah, 2
    int 21h
    call space_ele
    loop print_array
        
exit_programing: 
    mov ah, 4ch
    int 21h
MAIN Endp
    space_ele proc
        mov ah, 9
        lea dx, space
        int 21h
        ret
    space_ele endp
END MAIN