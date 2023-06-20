.model small
.stack 200h
.data
.code
    main proc
        ;clear bx to store
        xor bx, bx
        ;for shifting the storage 4 times
        mov cl, 4
        ;the first digit of first number
        mov ah, 1
        int 21h
        ;first number
        ;convert the input in binary and store
        while_: 
            ;checking carriage return
            cmp al, 0dh
            je end_while_ 
            
            ;check whether the input is number or letter
            cmp al, 39h
            jg letter_
            
            ;input is a number
            and al, 0fh
            jmp shift_
            
            ;input is a letter
            letter_:
                sub al, 37h
            
            ;make space for input    
            shift_:
                shl bx, cl
            
            ;insert value into bx
            or bl, al
            
            ;new input
            int 21h
            jmp while_ 
            
        end_while_:
        
        ;print a newline
        mov ah, 2
        mov dl, 0ah
        int 21h
        mov dl, 0dh
        int 21h
        
        ;clear dx to store
        xor dx, dx
        ;the first digit of second number
        mov ah, 1
        int 21h
        
        ;second number
        ;convert the input in binary and store
        
        while__:
            ;checking carriage return
            cmp al, 0dh
            je end_while__ 
            
            ;check whether the input is number or letter
            cmp al, 39h
            jg letter__
            
            ;input is a number
            and al, 0fh
            jmp shift__
            
            ;input is a letter
            letter__:
                sub al, 37h
            
            ;make space for input    
            shift__:
                shl dx, cl
            
            ;insert value into bx
            or dl, al
            
            ;new input
            int 21h
            jmp while__ 
        
        end_while__:
        
        ;adding the two inserted numbers
        add bx, dx
        
        ;print a newline
        mov ah, 2
        mov dl, 0ah
        int 21h
        mov dl, 0dh
        int 21h
        
        ;printing the summation in binary
        mov cx, 16
        mov ah, 2
        while___:
            shl bx, 1
            jc one_ ;carry is one
            
            ;carry is zero
            mov dl, '0'
            jmp output_ 
            
            one_:
                mov dl, '1'
            output_:
                int 21h
        loop while___        
                

        mov ah, 4ch
        int 21h
    main endp
end main    
