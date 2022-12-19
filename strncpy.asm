.ORIG x3000

LEA R1,str1
LEA R2,str2
LD R0,len

loop:
LDR R3,R1,x0000 	; chargement de str1[i] dans R3 (cour)
BRz fin
STR R3,R2,x0000 	; str2[i] = R3
ADD R1,R1,x0001 	; i++
ADD R0,R0,#-1   	; on décrémente R0

BRnp loop		; tant que R0 ne vaut pas 0 alors on boucle
BR fin

str1: .STRINGZ "chaine"
str2: .STRINGZ ""
len: .FILL x0003

fin:
.END

; pseudo-code:
; str1 = "chaineacopier"		// source
; str2 = "" 				// destination
; cour = str1[0]			// adresse du 1er caractère de str1
; len = 3				// longueur à copier
; while (cour != '\0' && len != 0)	
;	str2[0] = cour;
;	cour++
;	len--				// on décrémente len plutot que d'avoir un compteur car la condtion est plus facile a ecrire
; return str2
