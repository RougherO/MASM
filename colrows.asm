.MODEL SMALL
.STACK 100H
.DATA
    BYTES   DD 0040004CH
    ROWS    DB ?
    COLS    DB ?
    MSG1    DB 0DH,0AH,"TOTAL NO OF ROWS(IN HEX)=","$"
    MSG2    DB 0DH,0AH,"TOTAL NO OF COLUMNS(IN HEX)=","$"
    MSG3    DB 0DH,0AH,"PRESS ANY KEY TO CLEAR SCREEN","$"
    HEXCODE DB "0123456789ABCDEF"
.CODE
DISPLAY PROC
            PUSH AX
            PUSH BX
            PUSH CX
            PUSH DX
            LEA  DX, MSG1
            MOV  AH, 09H
            INT  21H
            MOV  AL, ROWS
            MOV  CL, 10H
            MOV  AH, 00H
            DIV  CL
            MOV  BL, AL
            MOV  DL, HEXCODE[BX]
            PUSH AX
            MOV  AH, 02H
            INT  21H
            POP  AX
            MOV  BL, AH
            MOV  DL, HEXCODE[BX]
            MOV  AH, 02H
            INT  21H
            LEA  DX, MSG2
            MOV  AH, 09H
            INT  21H
            MOV  AL, COLS
            MOV  CL, 10H
            MOV  AH, 00H
            MOV  BH, 00H
            DIV  CL
            MOV  BL, AL
            MOV  DL, HEXCODE[BX]
            PUSH AX
            MOV  AH, 02H
            INT  21H
            POP  AX
            MOV  BL, AH
            MOV  DL, HEXCODE[BX]
            MOV  AH, 02H
            INT  21H
            POP  DX
            POP  CX
            POP  BX
            POP  AX
            RET
DISPLAY ENDP
MAIN PROC
            MOV  AX, @DATA
            MOV  DS, AX
            MOV  AH, 0FH
            INT  10H
            MOV  COLS, AH
            MOV  CL, AH
            MOV  CH, 00
            PUSH DS
            LDS  SI, BYTES
            MOV  AX, [SI]
            POP  DS
            SHR  AX, 1
            DIV  CL
            MOV  ROWS, AL
            CALL DISPLAY
            LEA  DX, MSG3
            MOV  AH, 09H
            INT  21H
            MOV  AH, 01H
            INT  21H
            MOV  DH, 0
    AGAIN:  
            MOV  BH, 00
            MOV  DL, 00
            MOV  AH, 02H
            INT  10H
            MOV  BL, 00
            MOV  AL, 'X'
            MOV  AH, 09H
            INT  10H
            INC  DH
            CMP  DH, ROWS
            JB   AGAIN
            MOV  AH, 4CH
            INT  21H
MAIN ENDP
END MAIN
