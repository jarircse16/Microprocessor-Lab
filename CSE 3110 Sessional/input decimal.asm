.model small
.stack 100h
.data 
msg db 'Enter numbers:$'
msg2 db 'Corresponding character:$'
.code
main proc    
    mov ax,@data
    mov ds,ax
    
    xor bx,bx 
    xor cx,cx
    
    lea dx,msg
    mov ah,9
    int 21h
    
    repeat: 
    mov ah,1
    int 21h 
    
    cmp al,13 
    je repeat2
    
    and ax,000Fh
    push ax
    
    mov ax,10
    mul bx  
    pop bx
    add bx,ax
    
    jmp repeat 
    
    repeat2:
    mov dl,0Ah
    mov ah,2
    int 21h
    
    mov dl,0Dh
    mov ah,2
    int 21h
    
    x:
    mov ah,1
    int 21h 
    
    cmp al,13
    je addition
    
    and ax,000Fh
    push ax
    
    mov ax,10
    mul cx 
    pop cx
    add cx,ax   
    
    jmp x
    
    addition:    
    
    mov dl,0Ah
    mov ah,2
    int 21h
    
    mov dl,0Dh
    mov ah,2
    int 21h
    
    lea dx,msg2
    mov ah,9
    int 21h
    
    
    add bx,cx
    mov dl,bl
    mov ah,2
    int 21h
    
    mov ah,4ch
    int 21h
    
    main endp
end main