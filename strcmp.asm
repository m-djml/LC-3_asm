.ORIG x3000

LEA R1,str1 ; chargement des valeurs de str1 et str2
LEA R2,str2
LD R0,zero

loop: 
	LDR R3,R1,x0000 	; cour1 dans R3
	BRz suite		; si cour1 vaut 0 d'office on va tester cour2 pour voir s'il vaut 0 aussi
	
	
	LDR R4,R2,x0000 	; cour2 dans R4
	BRz if_n		; si cour2 vaut 0 d'office
	BR suite2		; sinon on continue le programme
suite:
	LDR R4,R2,x0000 	; cour2 dans R4 dans le cas où cour1 et cour2 valent '\0'
	BRz if_z
	
suite2:
	NOT R5,R3 		; on soustrait R3 à R4 pour voir si ça fait 0 et donc si R3 = R4
	ADD R5,R5,x0001
	ADD R5,R5,R4 		; R3 est dans R5
	
	BRp if_p		; if (cour1 > cour2)
	BRn if_n		; if (cour1 < cour2)
	
	ADD R1,R1,x0001 	; cour1++ ; cas où cour1 == cour2 on continue
	ADD R2,R2,x0001		; cour2++
	
	BR loop
	
if_p:
	ADD R0,R0,x0001
	BR fin
	
if_n:
	ADD R0,R0,#-1
	BR fin
	
if_z:
	LDR R0,R0,x0000
	BR fin
	
str1: .STRINGZ "bleuet"
str2: .STRINGZ "bleu"
zero: .FILL x0000

fin:
.END


; EXEMPLES
; str1 = "ballon"
; str2 = "talon"
; doit retourner R0 = 1 car 'b'<'t'
; str1 = "manche"
; str2 = "manchette"
; doit retourner R0 = 1
; str1 = "bleuet"
; str2 = "bleu" 
; doit retourner R0 = -1
;
; R0>0 si str1 est avant str2 dans le dictionnaire
; R0=0 si str1 et str2 sont égaux
; R0<0 si str1 est après str2 dans le dictionnaire
;
; pseudo-code :
; cour1 = str1[0]
; cour2 = str2[0]
; r0 = 0;
; while (cour1 != 0 && cour2 != 0) 	// tant que les deux chaines n'ont pas été fini d'être parcourues
; 	if (cour1 > cour2) 		// si le caractère courant dans la 1ère chaine est après le caractère courant de la 2e chaine
;	+	r0=1					   	
;	+	return r0
;	if (cour1 < cour2)		// si cour1 est avant cour2
;	o	r0=-1
;	o	return r0	
;	cour1++				// sinon on continue de parcourir les 2 chaines
;	cour2++
;	if (cour1 == 0 && cour2 != 0)   // si cour1 est plus court que cour2
;	+	r0=1
;	+	return r0
;	if (cour1 != 0 && cour2 == 0)   // si cour1 est plus long que cour2
;	o	r0=-1
;	o	return r0
;	r0=0				// cas restant : lorsque cour1 == cour2, on remet r0 à 0 pour montrer qu'ils sont identiques
; return r0
; les + et les o peuvent etre regroupés en un seul label dans le code asm (if_p et if_n)




