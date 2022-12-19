.ORIG x3000

AND R1, R0, x0000 ; R1 = mask1			
AND R2, R0, x0000 ; R2 = mask2
ADD R1, R1, x0001 ; R1 = 0000 0000 0000 0001	 masque contenant l'entier 1
ADD R2, R2, x0002 ; R2 = 0000 0000 0000 0010	 masque contenant le nombre de décalages à faire

LD R0, input
AND R4, R4, x0000 ; output
AND R3, R0, R1 

; opération de décalage de bits vers la droite
loop: 
BRz if

NOT R5, R4 ; not output
NOT R6, R2 ; not mask2
AND R7, R4, R2 ; not output and not mask2
NOT R7, R7
ADD R4, R4, R7

if:
ADD R1, R1, R1
ADD R2, R2, R2

AND R1, R1, R1
BRnp loop

; opération XOR de input et output
; XOR = !(!(!input.output) . !(input.!output))

NOT R1, R0 ; !input
NOT R2, R4 ; !output

AND R1, R1, R4 ; !input.output
AND R2, R2, R0 ; input.!output

NOT R1, R1 ; !(!input.output)
NOT R2, R2 ; !(input.!output)

AND R1, R1, R2; !(!input.output) . !(input.!output))
NOT R1, R1 ; !(!(!input.output) . !(input.!output))

input: .FILL x0003		; exemple avec l'entier 3

fin:
    .END
    

;if(mask1 and input!=0)
;    add output  mask2 or output
;mask1+=mask1
;mask2+=mask2
