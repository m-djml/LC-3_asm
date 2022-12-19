.ORIG x3000
; on va stocker le resultat dans R0
; adresse du caractère à trouver dans R2
; R1 = adresse du début de la chaine

LEA R1,chaine				; on charge l'adresse du premier caractere de str, c'est le caractère courant
LD R0, index 				; on initialise R0 à 0 (index)
LD R2,occ 				; on charge occ dans R2 

BRz fin 				; on teste si occ vaut 0 (caractère de fin) while 

loop: 
LDR R5, R1, x0000 			; chargement dans R5 du caractère pointé par R1

NOT R3,R5 				; on soustrait R5 à R2 pour voir si ça fait 0 et donc si R1 = R2
ADD R3,R3,x0001
ADD R3,R3,R2 				; R5 est dans R3

BRz fin 				; if (cour == occ) return index, càd si la soustraction vaut 0 alors on s'arrête là

ADD R0,R0,x0001 			; index ++ 
ADD R1,R1, x0001 			; i++ case suivante du tableau

BRnp loop ; on teste si R0 vaut pas '\0' 

chaine: .STRINGZ "anticonstitutionnellement"
occ: .FILL x0069 ; la lettre 'i' en ascii
index: .FILL x0000

fin:
.END

; R0 devrait contenir 3 à la fin du programme pour la 1ère occurrence de 'i' dans le mot "anticonstitutionnellement"


; str = "cabas"
; occ = 'a'
; cour = str[0]
; index = 0
; while (cour != '\0')
;   if (cour == occ)
;       return index
;   index++
; return index
