
include 'emu8086.inc'
.model small
.stack 200h
.data
     ;str db "hello$"      
     ;char db ?
.code 

    main proc    
        
        mov ax, @data
        mov ds, ax   
        
        printn 'hello'
        
        mov ah, 4ch
        int 21h  
        
    main endp    
    
end main    