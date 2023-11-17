.MODEL SMALL
.STACK 100H
.DATA
    STR1 DB "SORTED ARRAY:$"
    ARR1 DB 3,6,2,5,1
.CODE
MAIN PROC
          MOV  AX,@DATA
          MOV  DS,AX
          MOV  DX,OFFSET STR1
          MOV  AH,09H
          INT  21H
          MOV  DX,4
    L1:   
          MOV  CX,DX
          MOV  SI,OFFSET ARR1
    L2:   
          MOV  AL,[SI]
          INC  SI
          MOV  BL,[SI]
          CMP  AL,BL
          JLE  SKIP
          MOV  [SI],AL
          DEC  SI
          MOV  [SI],BL
          INC  SI
    SKIP: 
          LOOP L2
          DEC  DX
          CMP  DX,0
          JG   L1
    PRINT:
          MOV  CX,5
          MOV  SI,OFFSET ARR1
    L3:   
          MOV  DX,[SI]
          ADD  DX,48
          MOV  AH,02H
          INT  21H
          MOV  DX,32
          MOV  AH,02H
          INT  21H
          INC  SI
          LOOP L3
          MOV  AH,4CH
          INT  21H
MAIN ENDP
END MAIN