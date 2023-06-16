.MODEL SMALL
.STACK 100H
.DATA 
 n_line DB 0DH,0AH,"$"   

.CODE
   MAIN PROC
      MOV AX,@DATA      
      MOV DS,AX
      
      XOR BX,BX        
      MOV CL,4      
      
      
      MOV AH,1        
      INT 21h
      
      
      IN1:
          CMP AL,13  
          JE Line1    
         
      
          CMP AL,64   
          JG L1
          
          AND AL,0FH  
          JMP Shift1
          
      L1:         
          SUB AL,55
       
      Shift1:
          SHL BX,CL   
          OR  BL,AL
          
          INT 21h
          JMP INPUT1
      Line1:
          LEA DX,n_line
          MOV AH,9
          INT 21h
          
          XOR DX,DX  
          
          MOV AH,1
          INT 21h
          
      IN2:   
          CMP AL,13
          JE Line2
         
      
          CMP AL,64
          JG L2
          
          AND AL,0FH
          JMP Shift2
          
      L2:
          SUB AL,55
       
      Shift2:
          SHL DX,CL
          OR  DL,AL
          
          INT 21h
          JMP INPUT2
      Line2:
          MOV CX,DX
              
          LEA DX,n_line
          MOV AH,9
          INT 21h
          
      
      SUM:
          ADD BX,CX    
        
      EXIT:
        
    MAIN ENDP
   END MAIN