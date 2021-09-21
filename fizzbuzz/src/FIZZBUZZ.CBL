       IDENTIFICATION DIVISION.
       PROGRAM-ID. FIZZBUZZ.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 CURRENT PIC 999.
       01 CURRENT-RESULT PIC X(8).
       01 RESULT PIC 99.
       01 REMAIN PIC 99.
       
       PROCEDURE DIVISION.

       PERFORM PROCESS-NUMBER VARYING CURRENT FROM 1 BY 1 UNTIL 
       CURRENT >100.

       PROCESS-NUMBER SECTION. 
           DIVIDE CURRENT BY 15 GIVING RESULT REMAINDER REMAIN
           IF (REMAIN = ZERO)
               THEN MOVE "FIZZBUZZ"
                    TO CURRENT-RESULT
                    DISPLAY '>' CURRENT-RESULT '<'
                    ADD 1 TO CURRENT
           ELSE 
           DIVIDE CURRENT BY 3 GIVING RESULT REMAINDER REMAIN
           IF (REMAIN = ZERO)
               THEN MOVE "FIZZ"
                    TO CURRENT-RESULT
                    DISPLAY '>' CURRENT-RESULT '<'
                    ADD 1 TO CURRENT
           ELSE 
           DIVIDE CURRENT BY 5 GIVING RESULT REMAINDER REMAIN
           IF (REMAIN = ZERO)
               THEN MOVE "BUZZ"
                    TO CURRENT-RESULT
                    DISPLAY '>' CURRENT-RESULT '<'
                    ADD 1 TO CURRENT
           ELSE
           MOVE " " TO CURRENT-RESULT
           DISPLAY '>' CURRENT-RESULT '<'
           ADD 1 TO CURRENT
       END-PERFORM
       END PROGRAM FIZZBUZZ.
