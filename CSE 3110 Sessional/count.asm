.MODEL SMALL                                                                             
.STACK 100H
.DATA
MSG DB 'ENTER A NUMBER:$'
NLINE DB 0AH,0DH,"$"
OUTPUT DB 'NUMBER OF 1s:$'
KEEP DB 'NUMBER OF 0s:$'
X DB ?
Y DB 0
Z DB 0
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    
    MOV X,AL
    
    LEA DX,NLINE
    MOV AH,9
    INT 21H
    
    MOV AL,X
    
    MOV CX,8
    
    CNT:
    CMP CX,0
    JE EXIT
    
    SHL AL,1
    DEC CX
    
    JC COUNT
    INC Z
    JMP CNT
    
    COUNT:
    INC Y
    JMP CNT
    
    
    EXIT:
    LEA DX,NLINE
    MOV AH,9
    INT 21H
    
    LEA DX,OUTPUT
    MOV AH,9
    INT 21H 
    
    ADD Y,48
    
    MOV DL,Y
    MOV AH,2
    INT 21H 
    
    LEA DX,NLINE
    MOV AH,9
    INT 21H 
    
    LEA DX,KEEP
    MOV AH,9
    INT 21H 
    
    ADD Z,48
    
    MOV DL,Z
    MOV AH,2
    INT 21H  
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN