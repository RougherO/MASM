.MODEL SMALL
.STACK 100H
.DATA
    VAR1 DB "PALINDROME",10,13,"$"
    VAR2 DB "NOT PALINDROME",10,13,"$"
    VAR3 DB "ENTER NUMBER:$"
    NUM1 DW ?
    NUM2 DW ?
.CODE
MAIN PROC
               MOV  AX,@DATA
               MOV  DS,AX
               MOV  DX,OFFSET VAR3
               MOV  AH,09H
               INT  21H
               MOV  CX,10
               MOV  BX,0
    INPUT:     
               MOV  AH,01H
               INT  21H
               CMP  AL,13
               JE   TER
               SUB  AL,48
               MOV  AH,0
               PUSH AX
               MOV  AX,BX
               MUL  CX
               MOV  BX,AX
               POP  AX
               ADD  BX,AX
               JMP  INPUT
    TER:       
               MOV  NUM1,BX
               MOV  DX,0
               MOV  CX,10
               MOV  AX,0
    PALINDROME:
               XCHG BX,AX
               DIV  CX
               XCHG BX,AX
               ADD  AX,DX
               CMP  BX,0
               MOV  NUM2,AX
               JE   RESULT
               MUL  CX
               JMP  PALINDROME
    RESULT:    
               MOV  DX,0
               MOV  DX,NUM1
               MOV  AX,NUM2
               SUB  DX,AX
               CMP  DX,0
               JE   SUCCESS
               MOV  DX,OFFSET VAR2
               MOV  AH,09H
               INT  21H
               MOV  AH,4CH
               INT  21H
    SUCCESS:   
               MOV  DX,OFFSET VAR1
               MOV  AH,09H
               INT  21H
               MOV  AH,4CH
               INT  21H
MAIN ENDP
END MAIN