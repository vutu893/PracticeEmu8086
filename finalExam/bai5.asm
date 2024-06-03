;bai5: nhap vao 1 day bit roi chuyen sang he thap phan va hex
.model small
.stack 100h
.data
    msg1 db 10, 13, 'Enter a binary number 8bit: $'
    msg2 db 10, 13, '>>>> Result decimary: $'
    msg3 db 10, 13, '>>>> Result hexa: $'
    str db 256 dup('$')
    deci db 0 
    muoi dw 10
    cosohexa dw 16
    
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
    
    lea si, str+2
    xor cx, cx
    mov cl, str + 1

    call convert_binary_to_decima
    ;hien thi ket qua
    mov ah, 9
    lea dx, msg2
    int 21h
    
    xor ax, ax
    mov al, deci
    call print_result
    
    ;hien thi ket qua 2
    mov ah, 9
    lea dx, msg3
    int 21h
    
    xor ax, ax
    mov al, deci
    call convert_to_hexa  
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
    
    convert_binary_to_decima proc
        loop_deci:
            xor dx, dx
            mov dl, [si]
            sub dl, '0'
            sub cl, 1
            shl dl, cl
            add deci, dl
            inc si
            inc cl
            loop loop_deci 
        ret
    convert_binary_to_decima endp 
    
    convert_to_hexa proc
        cmp ax, 0000FH
        jle buffer
        jmp exit_buffer
        buffer:
            mov dx, 0
            add dx, '0'
            mov ah, 2
            int 21h
        exit_buffer:
            xor ax, ax
            mov al, deci
            xor cx, cx
        loop_hexa:
            xor dx, dx
            div cosohexa
            push dx
            inc cx
            cmp ax, 0
            jne loop_hexa
        print_result_hexa:
            pop dx
            cmp dx, 0000AH
            jl print_number
            jmp print_char
        print_number:
            add dx, '0'
            jmp end_if
        print_char:
            add dx, 55
            jmp end_if
        end_if:
            mov ah, 2
            int 21h
            loop print_result_hexa
            jmp end
        end:
        ret
    convert_to_hexa endp
        
    
END MAIN             
