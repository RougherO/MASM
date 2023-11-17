.MODEL SMALL
.STACK 100H
.DATA
    VAR1 DB "BEFORE SWAP",10,13,"$"
    VAR2 DB "AFTER SWAP",10,13,"$"
    NUM1 DW 9
    NUM2 DW 5
.CODE
MAIN PROC
         MOV  AX,@DATA
         MOV  DS,AX
SWAP MACRO NUMA,NUMB
                  MOV  BX,NUMA
                  MOV  CX,NUMB
                  MOV  NUMA,CX
                  MOV  NUMB,BX
ENDM
         MOV  DX,OFFSET VAR1
         MOV  AH,09H
         INT  21H
         MOV  DX,NUM1
         ADD  DL,30H
         MOV  AH,02H
         INT  21H
         MOV  DL,32
         MOV  AH,02H
         INT  21H
         MOV  DX,NUM2
         ADD  DL,30H
         MOV  AH,02H
         INT  21H
         MOV  DL,10
         MOV  AH,02H
         INT  21H
         MOV  DL,13
         MOV  AH,02H
         INT  21H
         SWAP NUM1,NUM2
         MOV  DX,OFFSET VAR2
         MOV  AH,09H
         INT  21H
         MOV  DX,NUM1
         ADD  DL,30H
         MOV  AH,02H
         INT  21H
         MOV  DL,32
         MOV  AH,02H
         INT  21H
         MOV  DX,NUM2
         ADD  DL,30H
         MOV  AH,02H
         INT  21H
         MOV  DL,10
         MOV  AH,02H
         INT  21H
         MOV  DL,13
         MOV  AH,02H
         INT  21H
         MOV  AH,4CH
         INT  21H
MAIN ENDP
END MAIN