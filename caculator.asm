;bai 13: may tinh +, -, x, / banng assembly 
;gioi han cua ket qua cac phep tinh la so 16 bit
.model small
.stack 100h
.data
    msg1 db 10, 13, '------------------My Caculator------------------$'
    msg2 db 10, 13, '1.Cong $'
    msg3 db 10, 13, '2.Tru(so thu nhat lon hon so thu hai)$'
    msg4 db 10, 13, '3.Nhan$'
    msg5 db 10, 13, '4.Chia$'
    msg6 db 10, 13, 'Chon phep tinh: $'
    msg7 db 10, 13, 'So thu nhat la: $'
    msg8 db 10, 13, 'So thu hai la: $'
    msg9 db 10, 13, 'Ket qua cua phep tinh la: $'
    msg10 db 10, 13, '5.Thoat khoi chuong trinh!!!$'
    var1 dw ?
    var2 dw ?
    var3 dw ?
    muoi dw 10
    str1 db 256 dup('$')
    str2 db 256 dup('$')
.code
MAIN Proc
    
    mov ax, @data
    mov ds, ax
start:
    
    ;hien thi giao dien
    lea dx, msg1
    call printmessage    
    lea dx, msg2
    call printmessage
    lea dx, msg3
    call printmessage
    lea dx, msg4
    call printmessage
    lea dx, msg5
    call printmessage
    lea dx, msg10
    call printmessage

input:
    ;nhap so thu nhat
    lea dx, msg7
    call printmessage
    
    lea dx, str1
    call nhapso
    
    ;nhap so thu hai
    lea dx, msg8
    call printmessage
    
    lea dx, str2
    call nhapso
convert_string_to_int:
    ;chuyen doi so thu nhat
    xor bx, bx
    xor cx, cx
    lea si, str1 + 2
    mov cl, str1 + 1
    xor dx, dx
    call convertstringtoint
    mov var1, bx
    
    ;chuyen doi so thu hai
    xor bx, bx
    xor cx, cx
    lea si, str2 + 2
    mov cl, str2 + 1
    xor dx, dx
    call convertstringtoint
    mov var2, bx 
choseoption: ;chon phep tinh thuc hien 
    
    lea dx, msg6
    call printmessage
    
    mov ah, 1
    int 21h

    cmp al,'1'
    je tong
    
    cmp al, '2'
    je hieu
    
    cmp al,'3'
    je tich
    
    cmp al,'4'
    je chia
    
    cmp al, '5'
    je exitprograming
        
tong:
    call sum
    jmp result
hieu:
    call subtract
    jmp result
tich:
    call multi
    jmp result
chia: 
    call divive
    jmp result
    
result:
    lea dx, msg9
    call printmessage
    mov ax, var3
    call printresult
    jmp start    
exitprograming:
    mov ah, 4ch
    int 21h
    
    
MAIN Endp
    nhapso proc
        mov ah, 10
        int 21h
        ret
    nhapso endp
    
    printmessage proc
        mov ah, 9
        int 21h
        ret
    printmessage endp
    
    convertstringtoint proc
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
    convertstringtoint endp
    
    printresult proc
        xor cx, cx
        loop_for1:
            xor dx, dx
            div muoi
            add dl, '0'
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
    
    sum proc
        xor ax, ax
        mov ax, var1
        add ax, var2
        mov var3, ax
        ret
    sum endp
    
    subtract proc
        xor ax, ax
        mov ax, var1
        sub ax, var2
        mov var3, ax
        ret
    subtract endp
    
    multi proc
        xor ax, ax
        mov ax, var1
        mul var2
        mov var3, ax
        ret
    multi endp
    
    divive proc
        xor ax, ax
        xor dx, dx
        mov ax, var1
        xor bx, bx
        mov bx, var2
        div bx
        mov var3, ax
        ret
    divive endp
        
END MAIN