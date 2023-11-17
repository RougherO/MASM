.MODEL SMALL
.STACK 100H
.DATA
    STR1 DB "GCD:$"
    NUM1 DB 96
    NUM2 DB 60
.CODE
MAIN PROC
          MOV  AX,@DATA
          MOV  DS,AX
          MOV  DX,OFFSET STR1
          MOV  AH,09H
          INT  21H
          MOV  AX,0
          MOV  BX,0
          MOV  AL,NUM1
          MOV  BL,NUM2
    GCD:  
          MOV  CX,0
          CMP  BL,0
          JE   TER
          DIV  BL
          MOV  CL,AH
          MOV  CH,BL
          MOV  BL,CL
          MOV  AX,0
          MOV  AL,CH
          JMP  GCD
    TER:  
          CALL PRINT
          MOV  AH,4CH
          INT  21H
MAIN ENDP
PRINT PROC
          MOV  DX,0
          MOV  BX,10
          MOV  CX,0
    L3:   
          DIV  BX
          PUSH DX
          MOV  DX,0
          MOV  AH,0
          INC  CX
          CMP  AX,0
          JNZ  L3
    L4:   
          POP  DX
          ADD  DX,48
          MOV  AH,02H
          INT  21H
          LOOP L4
          RET
PRINT ENDP
END MAIN