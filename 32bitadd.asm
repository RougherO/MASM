.MODEL SMALL
.STACK 100H
.DATA
      NUM1 DD 28118888H
      NUM2 DD 37319888H
      RES  DD ?
.CODE
MAIN PROC
            MOV  AX,@DATA
            MOV  DS,AX
            MOV  AX,0
            MOV  BX,0
            MOV  AL,BYTE PTR NUM1
            MOV  BL,BYTE PTR NUM2
            ADD  AL,BL
            DAA
            MOV  BYTE PTR RES,AL
            MOV  AX,0
            MOV  BX,0
            MOV  AL,BYTE PTR NUM1+1
            MOV  BL,BYTE PTR NUM2+1
            JNC  L5
            ADD  AL,01H
      L5:   
            ADD  AL,BL
            DAA
            MOV  BYTE PTR RES+1,AL
            MOV  AX,0
            MOV  BX,0
            MOV  AL,BYTE PTR NUM1+2
            MOV  BL,BYTE PTR NUM2+2
            JNC  L7
            ADD  AL,01H
      L7:   
            ADD  AL,BL
            DAA
            MOV  BYTE PTR RES+2,AL
            MOV  AX,0
            MOV  BX,0
            MOV  AL,BYTE PTR NUM1+3
            MOV  BL,BYTE PTR NUM2+3
            ADD  AL,BL
            DAA
            MOV  BYTE PTR RES+3,AL
            JNC  L8
            MOV  DX,01H
            ADD  DX,30H
            MOV  AH,02H
            INT  21H
      L8:   
            MOV  AX,0
            MOV  BX,0
            MOV  AL,BYTE PTR RES+3
            CALL PRINT
            MOV  AX,0
            MOV  AL,BYTE PTR RES+2
            CALL PRINT
            MOV  AX,0
            MOV  AL,BYTE PTR RES+1
            CALL PRINT
            MOV  AX,0
            MOV  AL,BYTE PTR RES
            CALL PRINT
            MOV  AH,4CH
            INT  21H
MAIN ENDP
PRINT PROC
            MOV  DX,0
            MOV  BX,10H
            MOV  CX,0
      L3:   
            DIV  BX
            PUSH DX
            MOV  DX,0
            INC  CX
            CMP  AX,0
            JNE  L3
      L4:   
            POP  DX
            ADD  DX,48
            MOV  AH,02H
            INT  21H
            LOOP L4
            RET
PRINT ENDP
END MAIN