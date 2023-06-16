.MODEL SMALL
.STACK 100H  
.DATA  

MSG DB 'ENTER CHOICE(Y/N):$'
EN DB 'ENTER NO.:$'
NLINE DB 0AH,0DH,"$" 
DE DB 'DECIMAL EQUIVALENT:$'
X DB ?
H DB ?  

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    CHOICE: 
    LEA DX,MSG
    MOV AH,9
    INT 21h
    
    MOV AH,1
    INT 21h
    
    CMP AL,'Y'
    JE INPUT 
    
    CMP AL,'N'
    JE EXIT   
    
    LEA DX,NLINE
    MOV AH,9
    INT 21h 
    
    JMP CHOICE
    
    INPUT:
    LEA DX,NLINE
    MOV AH,9
    INT 21h 
    
    LEA DX,EN
    MOV AH,9
    INT 21h
    
    MOV AH,1
    INT 21h 
    
    CMP AL,'0'
    JGE PROCESS1
    
    JMP INPUT  
    
    PROCESS1: 
    
    CMP AL,'9'
    JLE OUTPUT
    
    JMP PROCESS2
    OUTPUT: 
    
    MOV H,AL
   
    LEA DX,NLINE
    MOV AH,9
    INT 21h 
    
    LEA DX,DE
    MOV AH,9
    INT 21h 
      
    MOV AL,H  
    
    MOV DL,AL
    MOV AH,2
    INT 21h  
    
    LEA DX,NLINE
    MOV AH,9
    INT 21h 
    
    LEA DX,NLINE
    MOV AH,9
    INT 21h 
    
    JMP CHOICE   
    
    
    PROCESS2:
    
     CMP AL,'A'
     JGE PROCESS3
     
     JMP INPUT
     
    PROCESS3:
     CMP AL,'F'
     JLE CHOUT
     
     JMP INPUT 
    
    CHOUT:
     
    SUB AL,17 
    MOV X,AL 
    
    LEA DX,NLINE
    MOV AH,9
    INT 21h
    
    LEA DX,DE
    MOV AH,9
    INT 21h  
    
    MOV DL,'1'
    MOV AH,2
    INT 21H
     
    MOV AL,X
    MOV DL,AL
    INT 21h 
            
    LEA DX,NLINE
    MOV AH,9
    INT 21h
    
    LEA DX,NLINE
    MOV AH,9
    INT 21h         
            
   JMP CHOICE
    
    EXIT:
    MOV AH,4CH
    INT 21H 
    
    MAIN ENDP
END MAIN