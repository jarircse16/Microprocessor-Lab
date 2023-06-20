.model small
.stack 100h
.data  
    sum dw 0     
    sum1 dw 0
.code

    main proc
        
         mov ax, @data
         mov ds, ax
         
         mov sum, 0
         
         input_:
            mov ah, 1
            int 21h
            cmp al, 0dh
            je end_input_
            and al, 0fh
            xor ah, ah
            mov bx, ax
            mov ax, 1010b
            
            mul sum
            add bx, ax
            mov sum, bx
            jmp input_ 
            
            end_input_:
                mov ah, 2 
                mov dx, 0ah
                int 21h
                mov dx, 0dh
                int 21h
                
         mov sum1, 0
         
         input__:
            mov ah, 1
            int 21h
            cmp al, 0dh
            je end_input__
            and al, 0fh
            xor ah, ah
            mov bx, ax
            mov ax, 1010b
            
            mul sum1
            add bx, ax
            mov sum1, bx
            jmp input__ 
            
            end_input__:
                mov ah, 2 
                mov dx, 0ah
                int 21h
                mov dx, 0dh
                int 21h
            
            mov dx, sum1
            add sum, dx    
            mov cx, 16
            mov bx, sum
            mov ah, 2    
            print_:
                shl bx, 1
                jc _1_
                mov dl, '0'
                jmp a_
                _1_:
                    mov dl, '1'
                a_:
                    int 21h    
                loop print_
        
        
        
        
        
        
        
        
        
        
        mov ah, 4ch
        int 21h
    main endp
end main    