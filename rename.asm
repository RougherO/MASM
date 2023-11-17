.MODEL SMALL
.STACK 100H
.DATA
    FILE1   DB "old.txt$"
    FILE2   DB "new.txt$"
    SUCCESS DB "File changed successfully$"
    FAIL    DB "File not changed$"
.CODE
MAIN PROC
          MOV AX,@DATA
          MOV DS,AX

          MOV DX,OFFSET FILE1
          MOV DI,OFFSET FILE2
          MOV AH,56H
          INT 21H
          JC  ERROR
          MOV DX,OFFSET SUCCESS
          MOV AH,09H
          INT 21H
          MOV AH,4CH
          INT 21H
    ERROR:
          MOV DX,OFFSET FAIL
          MOV AH,09H
          INT 21H
          MOV AH,4CH
          INT 21H
MAIN ENDP
END MAIN