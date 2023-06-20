 
include "emu8086.inc"
.model small
.stack 200h
.data  
    str db '*****'
    str1 db '_____'
    str2 db 5 dup 'werty'
         db 5 dup 'water' 
.code
    main proc
        mov ax, @data
        mov ds, ax
        mov es, ax
        lea si, str
        lea di, str2
        cld  
        mov cx, 5
        rep movsb
        mov ah, 2
        mov cx, 5
        mov si, 0
        print_:
            mov dl, str2[si]
            inc si
            int 21h
            loop print_
        
        mov bx, 5
        ;lea si, str1    
        ;lea di, str2[bx]
        cld  
        mov cx, 5
        ;rep movsb
        mov ah, 2
        mov cx, 5 
        mov bx, 5
        mov si, 0
        print__:
            mov dl, str2[bx][si]
            inc si
            int 21h
            loop print__
            
            
        mov ah, 4ch
        int 21h
    main endp
end main    
