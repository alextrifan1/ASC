ASSUME cs:text_,ds:data_

;Se da un sir de octeti S. 
;Sa se obtina sirul D1 
;ce contine toate numerele pare din S 
;si sirul D2 ce contine toate numerele impare din S. 

data_ SEGMENT
s db 1, 5, 3, 8, 2, 9
ls equ $-S 
d1 db ls dup(0)
d2 db ls dup(0)
data_ ENDS

text_ SEGMENT

start:
mov ax, data_
mov ds, ax
; Evaluarea propriu-zisa a expresiei
mov si, 0
mov di, 0; d1
mov bp, 0; d2
mov cx, ls
repeta:
	mov al, s[si]
	cbw
	mov bl, 2
	idiv bl; ah - rest
	cmp ah, 0
	je par 
	jne impar
	par:
		mov dl, s[si]
		mov d1[di], dl
		add di, 1
		jmp endi
	impar:
		mov dl, s[si]
		mov d2[bp], dl
		add bp, 1
		jmp endi
	endi:
		add si, 1
loop repeta
; Terminarea programului
mov ax, 4c00h
int 21h
text_ ENDS

END start
