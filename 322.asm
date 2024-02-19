ASSUME cs:text_,ds:data_

;Se da un sir de dublucuvinte. Sa se obtina sirul format din octetii superiori ai 
;cuvitelor superioare din elementele sirului de dublucuvinte care sunt divizibili cu 3.

data_ SEGMENT
 
s DD 12345678h, 1A2B3C4Dh
ls equ ($-s)/4
d db ls dup(0)
aux dw ?
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
	;pun in dx:ax valoarea din sir 
	mov ax, word ptr s[si]
	mov dx, word ptr s[si+2]
	;verific daca se imparte la 3
	mov bl, 3
	mov bh, 0
	mov aux, cx ; recomandare gpt
	mov cx, 0
	div bx ; divided by zero 
	cmp dx, 0
	je divizibil
	divizibil:
		mov bl, byte ptr s[si+3]
		mov d[di], bl
		add di, 1
	add si, 4
	mov cx, aux
loop repeta

; Terminarea programului
mov ax, 4c00h
int 21h
text_ ENDS

END start
