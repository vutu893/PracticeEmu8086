;bai21: nhap 1 mang roi tinh tong cua mang
.model small
.stack 100h
.data
    msg1 db 10, 13, 'so phan tu cua mang la: $'
    msg2 db 10, 13, 'nhap mang: $'
    msg3 db 10, 13, 'tong cua mang da nhap la: $'
    space db 20, '$'
    n db ?
    arr db 100(?)
.code
MAIN Proc
MAIN Endp
END MAIN