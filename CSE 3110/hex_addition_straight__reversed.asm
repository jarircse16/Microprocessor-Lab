.model small
.stack 200h
.data
    
    ;To store the inputs
    num1 dw ?
    num2 dw ?
    
.code
    main proc 
        
        mov ax, @data
        mov ds, ax
        
        xor bx, bx   
        mov cl, 4    
        
        mov ah, 1    
        int 21h
        
        ;convert the first number input in binary and store:
        while_: 
            
            cmp al, 0dh
            je end_while_  
            
            cmp al, 39h
            jg letter_
            
            and al, 0fh
            jmp shift_
            
            letter_:
                sub al, 37h
            
            shift_:
                shl bx, cl
            
            or bl, al
            
            int 21h
            jmp while_ 
            
        end_while_:
        
        mov num1, bx
       
        mov ah, 2
        mov dl, 0ah
        int 21h
        mov dl, 0dh
        int 21h
        
        
        xor dx, dx      
        mov ah, 1      
        int 21h
        
        ;convert the second number input in binary and store:
        while__:
            
            cmp al, 0dh
            je end_while__ 
           
            cmp al, 39h
            jg letter__
            
            and al, 0fh
            jmp shift__
            
            letter__:
                sub al, 37h
              
            shift__:
                shl dx, cl
            
            or dl, al
            
            int 21h
            jmp while__ 
        
        end_while__:
        
        mov num2, dx
         
        ;add the two inserted numbers:
        xor bx, bx
        or bx, num1
        add bx, num2
     
        mov ah, 2
        mov dl, 0ah
        int 21h
        mov dl, 0dh
        int 21h
        
        ;print the summation in binary:
        mov cx, 16
        mov ah, 2
        while___:
            shl bx, 1
            jc one_ 
           
            mov dl, '0'
            jmp output_ 
            
            one_:
                mov dl, '1'
            output_:
                int 21h
        loop while___        
        
        mov ah, 2
        mov dl, 0ah
        int 21h
        mov dl, 0dh
        int 21h
        
        ;reverse the second input:
        
        mov dx, num2
        mov cl, 12
        xor bx, bx
        
        reverse_:
            mov ax, 0fh
            and ax, dx
            shl ax, cl
            or bx, ax
            sub cl, 4
            shr dx, 4
            
            cmp cl, 0
            jge reverse_
             
        ;add the first and the reversed second number:
        add bx, num1
        
        ;print the summation in binary:
        mov cx, 16
        mov ah, 2
        while____:
            shl bx, 1
            jc one__ 
            
            mov dl, '0'
            jmp output__ 
            
            one__:
                mov dl, '1'
            output__:
                int 21h
        loop while____        
        
        mov ah, 2
        mov dl, 0ah
        int 21h
        mov dl, 0dh
        int 21h
        
        mov ah, 4ch
        int 21h
    main endp
end main    
