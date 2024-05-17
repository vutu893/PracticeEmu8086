;bai10: tinh tong cua hai so tu 0 den 9
.model small
.stack 100h
.data
    msg1 db 10, 13, 'nhap so a: $'
    msg2 db 10, 13, 'nhap so b: $'
    msg3 db 10, 13, 'tong cua hai so la: $'
    muoi dw 10
    a db ?
    b db ?
.code 
MAIN Proc
     mov ax, @data
     mov ds, ax
     
     ;hien thi thong bao 1
     mov ah, 9
     lea dx, msg1
     int 21h
     
     ;nhap so a
     call nhapso
     mov a, al
     
     ;hien thi thong bao 2
     mov ah, 9
     lea dx, msg2
     int 21h
     
     ;nhap so b
     call nhapso
     mov b, al
     
     ;hien thi thong bao tinh tong 
     mov ah, 9
     lea dx, msg3
     int 21h
     
     mov al,a
     mov ah, b
     add al, ah
     mov ah, 0
     ;hien thi ket qua ra man hinh
     call hienthi
     
     exit_programing:
        mov ah, 4ch
        int 21h
      
MAIN Endp
nhapso proc
    mov ah, 1
    int 21h
    sub al, '0'
    ret
nhapso endp

hienthi proc
    xor cx, cx
    loop_for:   
        xor dx, dx
        div muoi
        push dx
        inc cx
        cmp ax, 0
        jne loop_for
    print:
        xor dx, dx
        pop dx
        add dx, '0'
        mov ah, 2
        int 21h
        loop print
    ret
hienthi endp
END MAIN