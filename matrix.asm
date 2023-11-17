.MODEL SMALL
.STACK 100H
.DATA
    M1   DB 1,2,3,4,5,6,7,8,9
    M2   DB 9,8,7,6,5,4,3,2,1
    PROD DB 9 DUP(0)
.CODE
MAIN PROC
          MOV  AX,@DATA
          MOV  DS,AX
          MOV  BP,OFFSET PROD
          MOV  SI,OFFSET M1
          MOV  DI,OFFSET M2
          MOV  CH,03H            ;matrix dimension
          MOV  CL,03H
    L1:   
          MOV  BL,CH
    L2:   
          MOV  DL,0
          MOV  DH,CH
    L3:   
          MOV  AL,[SI]
          MOV  AH,[DI]
          MUL  AH
          ADD  DL,AL
          INC  SI
          ADD  DI,03H
          DEC  DH
          CMP  DH,0
          JNZ  L3
          MOV  [BP],DL
          INC  BP
          SUB  SI,03H
          SUB  DI,09H
          INC  DI
          DEC  BL
          CMP  BL,0
          JNZ  L2
          ADD  SI,03H
          MOV  DI,OFFSET M2
          DEC  CL
          CMP  CL,0
          JNZ  L1
          MOV  CH,3
          MOV  BP,OFFSET PROD
    L4:   
          MOV  CL,3
    L5:   
          MOV  AL,[BP]
          PUSH CX
          CALL PRINT
          POP  CX
          INC  BP
          DEC  CL
          MOV  DX,32
          MOV  AH,02H
          INT  21H
          MOV  AX,0
          CMP  CL,0
          JNZ  L5
          MOV  DX,10
          MOV  AH,02H
          INT  21H
          MOV  DX,13
          MOV  AH,02H
          INT  21H
          MOV  DX,0
          MOV  AX,0
          DEC  CH
          CMP  CH,0
          JNZ  L4
          MOV  AH,4CH
          INT  21H
MAIN ENDP
PRINT PROC
          MOV  DX,0
          MOV  BX,10
          MOV  CX,0
    L6:   
          DIV  BX
          PUSH DX
          MOV  DX,0
          MOV  AH,0
          INC  CX
          CMP  AX,0
          JNZ  L6
    L7:   
          POP  DX
          ADD  DX,48
          MOV  AH,02H
          INT  21H
          LOOP L7
          RET
PRINT ENDP
END MAIN