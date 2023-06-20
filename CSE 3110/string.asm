title 2d array

.model small
.stack 200h
.data    
    asteric db '****'  
    str db 4 dup (?)
        db 4 dup (?)
        db 4 dup (?)
        db 4 dup (?)
.code
    main proc
        mov ax, @data
        mov ds, ax
        mov es, ax

        mov si, 0
        mov bx, 0
        mov cx, 16
        mov ah, 1
        in_:
            int 21h
            mov str[bx][si], al
            inc si
            loop in_
        
        int 21h
        sub al, 1
        mov bx, 0
        mov bl, al
        mov ax, 4
        mul bx 
        mov bx, ax
        lea di, str[bx]
        lea si, asteric 
        cld
        mov cx, 4
        rep movsb
        
            
        mov ah, 2
        mov dl, 0ah
        int 21h
        mov dl, 0dh
        int 21h
        
        mov cx, 16
        mov ah, 2
        mov bx, 0
        mov si, 0
        print_:
            mov dl, str[bx][si]
            int 21h  
            inc si
            cmp si, 4
            jne end_  
            
            mov si, 0
            add bx, 4  
            
            mov dl, 0ah
            int 21h
            mov dl, 0dh
            int 21h
            
            end_:
                loop print_
        
        
        mov ah, 4ch
        int 21h
    main endp
end main    
