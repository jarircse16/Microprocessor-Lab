.MODEL SMALL
.STACK 100H

.DATA

MSG1 DB "ENTER STRING : $"
MSG2 DB "REVERSE STRING : $" 
COUNT DW 0

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
   
    LEA DX, MSG1
    MOV AH,9
    INT 21H
    
    XOR CX, CX
    MOV AH,1
    INT 21H
    
 INPUT:  
    
    CMP AL,0DH
    JE END_INPUT
    PUSH AX
    INC CX
    INT 21H
    JMP INPUT
    
  END_INPUT:
  
    MOV DX, 0DH
    MOV AH,2
    INT 21H
    MOV DX,0AH
    MOV AH,2
    INT 21H
    
    MOV BX, 50H
    XCHG BX, SP
    PUSH 20H
    XCHG BX,SP
    INC COUNT
    
  LOOP1:
    
    POP DX
    XCHG BX, SP
    PUSH DX
    XCHG BX, SP
    INC COUNT
    LOOP LOOP1
    
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    
    MOV CX,COUNT
    MOV COUNT,0
    PUSH 0020H
    INC COUNT
    
  REVERSE:
  
    XCHG BX,SP
    POP DX
    XCHG BX,SP
    CMP DL,20H
    JNE SKIP
    
    MOV AH,2
    
  LOOP2:
  
    POP DX
    INT 21H
    
    DEC COUNT
    JNZ LOOP2
    
    MOV DX, 0020H
    
  SKIP:
    PUSH DX
    INC COUNT
    LOOP REVERSE
    
   MOV AH,4CH
   INT 21H
   MAIN ENDP
END MAIN