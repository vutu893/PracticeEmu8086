;bai19: sap xep tu be den lon
.model small
.stack 100h
.data
    msg1 db 10, 13, 'Nhap so phan tu cua mang: $'
    msg2 db 10, 13, 'Nhap mang: $'
    msg3 db 10, 13, 'Mang sau khi sap xep tu be den lon la: $'
    space db 32, '$'
    n db 0
    i db 1
    j db 0
    arr db 100 dup(?)
.code
MAIN Proc
    mov ax, @data
    mov ds, ax
    
    ;nhap thong bao 1
    lea dx, msg1
    call ngat_9
    
    ;nhap so phan tu
    mov ah, 1
    int 21h
    
    sub al, '0'
    mov n, al
    
    ;nhap mang
    lea dx, msg2
    call ngat_9
    xor cx, cx
    mov cl, n 
    xor bx,bx
    mov bl, 2
    lea si, arr
    lea di, arr
loop_input:
    mov ah, 1
    int 21h
    sub al, '0'
    mov dl, al
    mov [si + bx], dl
    inc bx
    call space_ele
    loop loop_input

    ;soft
    lea dx, msg3
    call ngat_9
    
    xor cx,cx
    mov cl, n
    add cl, 1
    
outer_loop:
    mov si, 0         ; SI will be used as the index for the array
    mov bx, cx        ; BX = CX, inner loop counter

inner_loop:
    mov al, [arr + si]       ; Load the current element into AL
    mov ah, [arr + si + 1]   ; Load the next element into AH

    cmp al, ah         ; Compare AL and AH
    jbe no_swap        ; If AL <= AH, no swap is needed

    ; Swap elements
    mov [arr + si], ah
    mov [arr + si + 1], al

no_swap:
    inc si            ; Move to the next element
    dec bx            ; Decrement inner loop counter
    jnz inner_loop    ; If BX != 0, repeat inner loop

    dec cx            ; Decrement outer loop counter
    jnz outer_loop    ; If CX != 0, repeat outer loop

    ;hien thi
    xor cx, cx
    mov cl, n
    lea si, arr + 2
loop_for:
    xor dx, dx
    mov dl, [si]
    add dl, '0'
    mov ah, 2
    int 21h
    call space_ele
    inc si
    loop loop_for
        
exit_programming:
    mov ah, 4ch
    int 21h
MAIN Endp
    ngat_9 proc
        mov ah, 9
        int 21h
        ret
    ngat_9 endp
    space_ele proc
        mov ah, 9
        lea dx,space
        int 21h
        ret
    space_ele endp
END MAIN