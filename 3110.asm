ASSUME cs:text_,ds:data_

;Se dau 2 siruri de octeti S1 si S2 de aceeasi lungime. 
;Sa se construiasca sirul D astfel incat fiecare element
;din D sa reprezinte maximul dintre elementele de pe pozitiile corespunzatoare din S1 si S2. 

data_ SEGMENT
 s1 db 1, 3, 6, 2, 3, 7
 ls equ $-s1
 s2 db 6, 3, 8, 1, 2, 5
 d db ls dup(0)
data_ ENDS

text_ SEGMENT

start:
mov ax, data_
mov ds, ax
; Evaluarea propriu-zisa a expresiei
mov si, 0
mov di, 0
mov cx, ls 
repeta:
	mov al, s1[si]
	mov bl, s2[si]
	cmp al, bl 
	jg sir1
	jng sir2
	je egal
	sir1:
		mov d[di], al 
		jmp endiff
	sir2:
		mov d[di], bl
		jmp endiff
	egal:
		mov d[di], al 
		jmp endiff
	endiff:
		add di, 1
		add si, 1
loop repeta
; Terminarea programului
mov ax, 4c00h
int 21h
text_ ENDS

END start
