;bai22: tim min va max trong 1 mang: so trong mang la so 8bit
;cac buoc lam:
;b1: xu li chuoi nhap vao de bien thanh so 8bit
;b2: SI truy cap  ele input , DI de truy cap arr
;b3: debug: trong vong lap min_max ==> cx bi tran khi tu 0 tru 1 bang FFH ==> vong lap bi sai => can than cx 
;b4: viet ham hien thi so
;b5: in ra ket qua

.model small
.stack 100h
.data
    msg1 db 10, 13, 'Nhap so phan tu: $'
    msg2 db 10, 13, 'Nhap mang: $'
    msg3 db 10, 13, 'So lon nhat la: $'
    msg4 db 10, 13, 'So nho nhat la: $'
    msg5 db 32, '$'
    n db ?
    tmp db ?
    ele db 256 dup('$')
    max db 0
    min db 127
    arr db 100 dup(?)
    muoi dw 10
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
    mov tmp, al
    ;hien thi thong bao 2
    mov ah, 9
    lea dx, msg2
    int 21h
    
    ;nhap cac phan tu vao mang
    lea di, arr + 2
    
loop_input:
    call input_string
    lea si, ele + 2  
    xor cx, cx
    mov cl, ele + 1 
    
    call convert_string_to_int
    
    ;nhap var vao mang arr
    
    mov [di], bl
    inc di
    ;xoa ele de nhap tiep
     
    call reset_string
    
    call space_ele
    
    sub tmp, 1
    cmp tmp, 0
    jne loop_input
    
min_max:
    xor cx,cx
    mov cl, n
    sub di, cx
        
start_check:
    xor ax, ax
    mov al, [di]
    cmp cx, 0
    je hien_thi_min
    
if:   
    cmp al, min
    jle min_ele
    
else_if:
    cmp al, max
    jge max_ele
    
    dec cx
    jmp end_if
min_ele:
    mov min, al
    inc di
    dec cx
    jmp start_check
max_ele:
    mov max, al
    inc di
    dec cx
    jmp start_check
end_if:
    inc di
    cmp cx, 0
    jne start_check
    
    ;hien thi ket qua
hien_thi_min:
    mov ah, 9
    lea dx, msg4
    int 21h
    
    xor ax, ax
    mov al, min
    call printresult

hien_thi_max:
    mov ah, 9
    lea dx, msg3
    int 21h
    
    xor ax, ax
    mov al, max
    call printresult
          
exit_programing:
    mov ah, 4ch
    int 21h    
MAIN Endp
    convert_string_to_int proc 
        xor dx, dx
        xor bx, bx
        loop_for:
           xor ax, ax
           mov al, 10
           mul bx
           mov dl,[si]
           sub dl, '0'
           add ax, dx
           inc si
           mov bx, ax
           loop loop_for
           ret 
    convert_string_to_int endp
    
    space_ele proc
        mov ah, 9
        lea dx, msg5
        int 21h
        ret
    space_ele endp
    
    input_string proc
        mov ah, 10
        lea dx, ele
        int 21h
        ret
    input_string endp                                    
    
    reset_string proc
        mov byte ptr [ele + 1],0 
        ret
    reset_string endp 
    
    printresult proc
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
        
    printresult endp
END MAIN
    