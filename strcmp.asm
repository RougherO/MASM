.MODEL SMALL
.STACK 100H
.DATA
    STR1 DB "BLUE$"
    STR2 DB "B$"
    STR3 DB "EQUAL",10,13,"$"
    STR4 DB "NOT EQUAL",10,13,"$"
.CODE
MAIN PROC
            MOV AX,@DATA
            MOV DS,AX
            MOV AL,0
            MOV BL,0
            MOV CX,0
            MOV SI,OFFSET STR1
            MOV DI,OFFSET STR2
    COMPARE:
            MOV AL,[SI]
            MOV BL,[DI]
            CMP AL,36
            JE  TER
            CMP BL,36
            JE  TER
            CMP AL,BL
            JNE TER
            INC SI
            INC DI
            JMP COMPARE
    TER:    
            CMP AL,BL
            JNE FAIL
            MOV DX,OFFSET STR3
            MOV AH,09H
            INT 21H
            MOV AH,4CH
            INT 21H
    FAIL:   
            MOV DX,OFFSET STR4
            MOV AH,09H
            INT 21H
            MOV AH,4CH
            INT 21H
MAIN ENDP
END MAIN