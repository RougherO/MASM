.MODEL SMALL
.STACK 100H
.DATA
    PASS  DB "SUCCESS$"
    FAIL  DB "FAILURE$"
    ARR   DB 3,6,1,2,5,7
    INPUT DB "ENTER KEY:$"
.CODE
MAIN PROC
         MOV  AX,@DATA
         MOV  DS,AX
         MOV  DX,OFFSET INPUT
         MOV  AH,09H
         INT  21H
         MOV  AX,0
         MOV  AH,01H
         INT  21H
         MOV  BL,AL
         SUB  BL,48
         MOV  DX,10
         MOV  AH,02H
         INT  21H
         MOV  CX,6
         MOV  SI,OFFSET ARR
    L1:  
         CMP  BL,[SI]
         JE   L2
         INC  SI
         LOOP L1
    L3:  
         MOV  DX,OFFSET FAIL
         MOV  AH,09H
         INT  21H
         JMP  L4
    L2:  
         MOV  DX,OFFSET PASS
         MOV  AH,09H
         INT  21H
    L4:  
         MOV  AH,4CH
         INT  21H
MAIN ENDP
END MAIN