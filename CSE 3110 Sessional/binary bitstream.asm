.MODEL SMALL
.STACK 100H
.DATA 
MSG DB 'ENTER BINARY BITSTREAM:$'
NLINE DB 0AH,0DH,'$' 
NEW DB 'CORRESPONDING DECIMAL:$' 
X DB ?
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG
    MOV AH,9
    INT 21H 
    
    MOV CX,8
    
    XOR DL,DL
    
    CNT:
    CMP CX,0
    JE EXIT
    
    MOV AH,1
    INT 21H
    
    DEC CX
    
    AND AL,01H
    
    SHL DL,1
    OR DL,AL
    
    JMP CNT
    
    EXIT: 
    ADD DL,48
    
    MOV X,DL
    
    LEA DX,NLINE
    MOV AH,9
    INT 21H  
    
    LEA DX,NEW
    MOV AH,9
    INT 21H 
    
    MOV DL,X
    MOV AH,2 
    INT 21H
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
    