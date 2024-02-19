ASSUME cs:text_,ds:data_

;1. Se da un sir de cuvinte s. 
;Sa se construiasca sirul de octeti d, 
;astfel incat d sa contina pentru fiecare pozitie din s:
;- numarul de biti de 0, daca numarul este negativ
;- numarul de biti de 1, daca numarul este pozitiv

data_ SEGMENT
s dw -22, 145, -48, 127
ls equ ($-s)/2
d db ls dup(0)
aux dw ?
data_ ENDS

text_ SEGMENT

start:
mov ax, data_
mov ds, ax
mov es, ax
; Evaluarea propriu-zisa a expresiei
mov si, offset s
mov di, 0
mov cx, ls 
cld
repeta:
	lodsw; ds:si -> ax , si = si +2
	cmp ax, 0
	jg pozitiv ; codul e aproape bine :{ 
	jl negativ
	pozitiv:
		mov bl, 0
		mov aux, cx; salvam contorul
		mov cx, 16; avem 16 biti de parcurs
		countBits1:; shiftam fiecare bit din ax
			shl ax, 1
			adc bl, 0; putem aduna direct cu carry flag
			clc
		loop countBits1
		mov cx, aux 
		mov d[di], bl
		jmp endiff
	negativ:
		neg ax; negam valorile din ax ca sa putem folosi alg de mai sus
		mov bl, 0
		mov aux, cx
		mov cx, 16;
		countBits0:; shiftam fiecare bit din ax
			shl ax, 1
			adc bl, 0; putem aduna direct cu carry flag
			clc
		loop countBits0
		mov cx, aux 
		mov d[di], bl
		jmp endiff
	endiff:
		add di, 1
loop repeta
; Terminarea programului
mov ax, 4c00h
int 21h
text_ ENDS

END start
