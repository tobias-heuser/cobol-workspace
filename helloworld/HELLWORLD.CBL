       IDENTIFICATION DIVISION.
       PROGRAM-ID. halloWelt.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 TAGESZEIT PIC X(20).
         88 VORMITTAG VALUE "VORMITTAG".
       PROCEDURE DIVISION.
           PERFORM 3 TIMES
               PERFORM CONSOLE_INPUT
               IF VORMITTAG
               THEN
               DISPLAY "GUTEN MORGEN"
               ELSE
               DISPLAY "Hallo Welt!"
               END-IF
           END-PERFORM
       STOP RUN.
       CONSOLE_INPUT SECTION.
           DISPLAY "Bitte gib die Tageszeit an (VORMITTAG oder leer)"
           ACCEPT TAGESZEIT
           EXIT.
