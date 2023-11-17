.MODEL SMALL
.STACK 100H
.DATA
      ARR  DB 0,10,22,67,81,92,101,102,0,91
      STR1 DB "LARGEST NUMBER:$"
.CODE
MAIN PROC
            MOV  AX,@DATA
            MOV  DS,AX
            MOV  DX,OFFSET STR1
            MOV  AH,09H
            INT  21H
            MOV  DX,0
            MOV  SI,OFFSET ARR
            MOV  CX,10
            MOV  AX,0
            MOV  DL,[SI]
      L1:   
            MOV  BL,[SI]
            CMP  BL,DL
            JLE  L2
            MOV  DL,BL
      L2:   
            INC  SI
            LOOP L1
            MOV  AL,DL
      PRINT:
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
            JNE  L3
      L4:   
            POP  DX
            ADD  DX,48
            MOV  AH,02H
            INT  21H
            LOOP L4
            MOV  AH,4CH
            INT  21H
MAIN ENDP
END MAIN