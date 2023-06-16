.model small
.stack 100h
.data
msg db 'Enter a string:$'   
nline db 0AH,0DH,"$"   
count db 0
string db ?
.code
main proc
    mov ax,@data
    mov ds,ax  
    mov ax,@data
    mov es,ax
    
    lea dx,msg
    mov ah,9
    int 21h   
    
    xor bx,bx
    
    lea di,string
    cld
   
    label:
    mov ah,1
    int 21h 
    cmp al,13
    je next
    
    inc bx
    stosb
    jmp label
     
    next: 
    lea di,string
    
    mov si,di
    mov cx,bx
    dec bx
    add si,bx
    shr cx,1 
    
    xchg_loop:
    mov al,[di]
    xchg al,[si]
    mov [di],al
    
    add di,1
    sub si,1  
    
    loop xchg_loop
    
    lea dx,nline
    mov ah,9
    int 21h
    
   
    inc bx
    mov cx,bx 
    lea di,string
    lab:
    mov dl,[di] 
    mov ah,2
    int 21h
    
    add di,1
    loop lab
     
    mov ah,4ch
    int 21h
    main endp
end main
