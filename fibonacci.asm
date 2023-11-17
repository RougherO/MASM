.MODEL SMALL
.STACK 100H
.DATA
      STR1 DB "FIBONACCI NUMBERS: $"
      T1   DB 00H
      T2   DB 01H
.CODE
MAIN PROC
            MOV  AX,@DATA
            MOV  DS,AX
            MOV  DX,OFFSET STR1
            MOV  AH,09H
            INT  21H
            MOV  CX,10
      L1:   
            MOV  AH,0
            MOV  AL,T1
            PUSH CX
            CALL PRINT
            POP  CX
            MOV  DL,T1
            MOV  BL,T2
            MOV  T1,BL
            ADD  DL,BL
            MOV  T2,DL
            MOV  DL,32
            MOV  AH,02H
            INT  21H
            MOV  DL,0
            LOOP L1
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