.MODEL SMALL
.STACK 100H
.DATA
MSG DB 'Please Enter a character: $'   
UP DB 'UPPER CASE: $'
nline DB 0AH,0DH,"$" 
X DB ?
FG DB ?
.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG
    MOV AH,9
    INT 21h 
    
    LEA DX,nline
    MOV AH,9
    INT 21h 
    
    MOV AH,1
    INT 21h 
    
    MOV FG,AL
    
    LEA DX,nline
    MOV AH,9
    INT 21h   
    
    LEA DX,UP
    MOV AH,9
    INT 21h 
    
    MOV AL,FG 
    
    MOV X,32
    SUB AL,X
    
    MOV DL,AL
    MOV AH,2
    INT 21h
    
    MOV AH,4CH
    INT 21h
    
    MAIN ENDP
END MAIN