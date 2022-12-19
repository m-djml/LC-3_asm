.ORIG x00

LEA R1,str1
LEA R2,str2

loop:
LDR R0,R1,x0000 	; chargement de str1[i] dans R0 (cour)
BRz fin
STR R0,R2,x0000 	; str2[i] = R0
ADD R1,R1,x0001 	; i++

BR loop

str1: .STRINGZ "chaine"
str2: .STRINGZ ""

fin:
ADD R0,R2,x0000
.END

; pseudo-code:
; str1 = "chaineacopier"	// source
; str2 = "" 			// destination
; cour = str1[0]		// adresse du 1er caractère de str1
; while (cour != '\0')		// tant que cour ne vaut pas 0
;	str2[0] = cour;
;	cour++
; return str2
