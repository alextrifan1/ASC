ASSUME cs:text_,ds:data_

;. Se da un sir de octeti S de lungime l. Sa se construiasca sirul D de lungime l-1 
;astfel incat elementele din D sa reprezinte produsul dintre fiecare 2 elemente consecutive 
;S(i) si S(i+1) din S. 

data_ SEGMENT
 
data_ ENDS

text_ SEGMENT

start:
mov ax, data_
mov ds, ax
; Evaluarea propriu-zisa a expresiei

; Terminarea programului
mov ax, 4c00h
int 21h
text_ ENDS

END start
