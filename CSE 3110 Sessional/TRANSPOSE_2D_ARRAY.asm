.MODEL SMALL
.STACK 100H
.DATA
    MYARRAY DW '6','5','5','6'
            DW '1','4','8','5'
            DW '7','2','9','6'
            DW '2','5','3','8'  
                             
    COUNT DB 0     
    NLINE DB 0AH,0DH,"$"

.CODE

MAIN PROC             
    
    MOV AX,@DATA
    MOV DS,AX

    XOR BX,BX
    XOR SI,SI
      
    
    PRINT:  
        INC COUNT
        MOV CX,4
        
        
        PRINTAGAIN:
            MOV DX,MYARRAY[BX][SI]  
            MOV AH,2
            INT 21H
            ADD SI,8
            LOOP PRINTAGAIN 
            
            
        LEA DX,NLINE
        MOV AH,9
        INT 21H
        
        SUB SI,30
        
        CMP COUNT,4
        JE ENDING    
            
        JMP PRINT
        
        ENDING:
    
    MOV AH,4CH
    INT 21H
    
MAIN ENDP
END MAIN

