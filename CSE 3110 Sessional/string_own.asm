.MODEL SMALL
.STACK 100H
.DATA  

MSG DB 'ENTER THE STRING LENGTH(1-9):$' 
EN DB 'ENTER CHARACTER: $' 
OUTPUT DB 'NUMBER:$'
LC DB ? 
COUNT DB 48

.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX     
    
    LEA DX,MSG
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H 
    
    MOV LC,AL
    
    MOV DL,0AH
    MOV AH,2
    INT 21H
    MOV DL,0DH
    INT 21H 
    
    MOV BL,5 
    
    LEA DX,EN
    MOV AH,9
    INT 21H 
    
    INPUT:
      CMP LC,48
      JE EXIT 
      
      MOV AH,1
      INT 21H
      
      SUB LC,1 
    
      CMP AL,'A'
      JE CHECK
 
      CMP AL,'E'
      JE CHECK 

      CMP AL,'I'
      JE CHECK
 
      CMP AL,'O'
      JE CHECK
     
      CMP AL,'U'
      JE CHECK 
      
      JMP INPUT
      
    CHECK:
      CMP AL,BL
      JA CHECK2
      
      JMP INPUT
      
    CHECK2:
      MOV BL,AL 
      INC COUNT
      
      JMP INPUT
      
    EXIT:
      MOV DL,0AH
      MOV AH,2
      INT 21H
      MOV DL,0DH
      INT 21H
      
      LEA DX,OUTPUT
      MOV AH,9
      INT 21H
        
      MOV DL,COUNT
      MOV AH,2
      INT 21H
      
      MOV AH,4CH
      INT 21H
      
    MAIN ENDP
END MAIN