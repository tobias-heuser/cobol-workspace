       IDENTIFICATION DIVISION.
       PROGRAM-ID.  MAIN.
      *****************************************************************
      * Hülle für das Programm
      *****************************************************************       
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       DATA DIVISION.   
       WORKING-STORAGE SECTION.
       01 FINAL-LETTER PIC X.
       01 DIA-W PIC 99.
       01 CUR-W PIC 99 VALUE 0.
       01 CUR-SUB-W PIC 99 VALUE 0.
       01 LETTER PIC X VALUE "A".
       01 CUR-L PIC 99 VALUE 1.
       01 TEMP PIC 99.
       01 CUR-COL PIC 9. 
       PROCEDURE DIVISION.
           PERFORM CONSOLE-INPUT
           PERFORM CALC-WIDTH UNTIL LETTER > FINAL-LETTER
           DISPLAY DIA-W
           MOVE "A" TO LETTER
           PERFORM PRINT-LETTER-INCR UNTIL LETTER > FINAL-LETTER
           PERFORM DECREMENT-LETTER
           PERFORM PRINT-LETTER-DECR UNTIL LETTER = "A"
       STOP RUN.

       CONSOLE-INPUT SECTION.
           DISPLAY "Pleae supply a letter for the widest point"
           ACCEPT FINAL-LETTER
           EXIT.

       DECREMENT-LETTER SECTION.
           INSPECT LETTER 
           CONVERTING 
           "BCDEFGHIJKLMNOPQRSTUVWXYZ"
           TO 
           "ABCDEFGHIJKLMNOPQRSTUVWXY"
           EXIT.
       
       INCREMENT-LETTER SECTION.
           INSPECT LETTER 
           CONVERTING 
           "ABCDEFGHIJKLMNOPQRSTUVWXY"
           TO 
           "BCDEFGHIJKLMNOPQRSTUVWXYZ"
           EXIT.

       PRINT-LETTER-INCR SECTION.
           MOVE FUNCTION MOD(CUR-L, 7) TO CUR-COL
           ADD 1 TO CUR-COL
           IF LETTER = "A"
               MOVE DIA-W TO CUR-W
               MOVE DIA-W TO CUR-SUB-W
               DISPLAY "A" AT LINE CUR-L COLUMN DIA-W WITH 
                   FOREGROUND-COLOR IS CUR-COL 
               PERFORM INCREMENT-LETTER
               ADD 1 TO CUR-L
           ELSE 
               ADD 1 TO CUR-W
               SUBTRACT 1 FROM CUR-SUB-W
               DISPLAY LETTER AT LINE CUR-L COLUMN CUR-SUB-W WITH 
                   FOREGROUND-COLOR IS CUR-COL
               DISPLAY LETTER AT LINE CUR-L COLUMN CUR-W WITH 
                   FOREGROUND-COLOR IS CUR-COL
               PERFORM INCREMENT-LETTER
               ADD 1 TO CUR-L
           EXIT.

       PRINT-LETTER-DECR SECTION.
           MOVE FUNCTION MOD(CUR-L, 7) TO CUR-COL
           ADD 1 TO CUR-COL
           IF LETTER = "A"
               MOVE DIA-W TO CUR-W
               MOVE DIA-W TO CUR-SUB-W
               DISPLAY "A" AT LINE CUR-L COLUMN DIA-W WITH 
                   FOREGROUND-COLOR IS CUR-COL
           ELSE 
               PERFORM DECREMENT-LETTER
               SUBTRACT 1 FROM CUR-W
               ADD 1 TO CUR-SUB-W
               DISPLAY LETTER AT LINE CUR-L COLUMN CUR-SUB-W WITH 
                   FOREGROUND-COLOR IS CUR-COL
               DISPLAY LETTER AT LINE CUR-L COLUMN CUR-W WITH 
                   FOREGROUND-COLOR IS CUR-COL
               ADD 1 TO CUR-L
           EXIT.

       CALC-WIDTH SECTION.
           ADD 1 TO DIA-W
           PERFORM INCREMENT-LETTER
           EXIT.
           