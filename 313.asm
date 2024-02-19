ASSUME cs:text_,ds:data_

;Se dau doua siruri de octeti S1 si S2 de aceeasi lungime.
;Sa se construiasca sirul D astfel:
;fiecare element de pe pozitiile pare din D este suma elementelor
;de pe pozitiile corespunzatoare din S1 si S2,
;iar fiecare element de pe pozitiile impare are ca si valoare diferenta 
;elementelor de pe pozitiile corespunzatoare din S1 si S2. 

data_ SEGMENT
 s1 db 1,2,3,4
 ls equ $-s1
 s2 db 5,6,7,8
 d db ls dup(0)
data_ ENDS

text_ SEGMENT

start:
mov ax, data_
mov ds, ax
; Evaluarea propriu-zisa a expresiei
mov si, 0
mov cx, ls 
repeta:
	mov ax, si
	mov bl, 2
	div bl; al-cat, ah-rest
	cmp ah, 0
	je par 
	jne impar 
	par: 
		mov bl, s2[si]
		add bl, s1[si]
		mov d[si], bl
		jmp endi  
	impar:
		mov bl, s2[si]
		sub bl, s1[si]
		mov d[si], bl
		jmp endi
	endi:
		add si, 1
loop repeta
; Terminarea programului
mov ax, 4c00h
int 21h
text_ ENDS

END start
