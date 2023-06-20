.model small 
.stack 100h 

.data

num db ?
sqr db ?  

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 1
    int 21h  

    sub al, 30h
    mov bl, al
    mul bl
    add bl, 30h
    mov num, bl
    mov sqr, al; convert sqr to charecter
    
    mov ah, 2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    
    mov cx, 5
    mov bx, 0
    mov ah, 2
    loop_:
         cmp cx, 3
         jne cx_3
         cmp bx, 2
         jne cx_3
         
         mov dl, sqr
         jmp exit_cx_3
         
         cx_3:
            mov dl, num
            
         exit_cx_3:   
         int 21h
         inc bx
         
         cmp bx, 5
         jne loop_
         mov bx, 0
         mov dl, 0ah
         int 21h
         mov dl, 0dh
         int 21h
         
            loop loop_

    mov ah, 4ch
    int 21h
    
    main endp
end main
           
           

    
    