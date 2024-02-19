ASSUME cs:text_,ds:data_

;. Se da un sir de octeti S de lungime l. Sa se construiasca sirul D de lungime l-1 
;astfel incat elementele din D sa reprezinte produsul dintre fiecare 2 elemente consecutive 
;S(i) si S(i+1) din S. 

data_ SEGMENT
 s db 1,2,3, 4
 ls equ $-s
 d dw ls-1 dup(0)
data_ ENDS

text_ SEGMENT

start:
mov ax, data_
mov ds, ax
; Evaluarea propriu-zisa a expresiei
mov si, 0
mov di, 0
mov cx, ls-1
repeta:
	mov al, s[si]
	add si, 1
	mov bl, s[si]
	imul bl; ax = s[si]*s[si+1]
	mov d[di], ax 
	add di, 2
loop repeta
; Terminarea programului
mov ax, 4c00h
int 21h
text_ ENDS

END start
