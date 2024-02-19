ASSUME cs:text_,ds:data_

;. Se dau doua siruri de octeti S1 si S2.
;Sa se construiasca sirul D prin concatenarea elementelor 
;din sirul S1 1uate de la stanga spre dreapta si a elementelor din sirul S2 luate de la dreapta spre stanga 

data_ SEGMENT
s1 db 1, 2, 3, 4
ls1 equ $-s1 
s2 db 5,6,7
ls2 equ $-s2
d db ls1+ls2 dup(0)
data_ ENDS

text_ SEGMENT

start:
mov ax, data_
mov ds, ax
; Evaluarea propriu-zisa a expresiei
; primul sir
mov si, 0
mov di, 0
mov cx, ls1
repeta:
	mov al, s1[si]
	mov d[di], al 
	add si, 1
	add di, 1
loop repeta
; al doilea sir
mov si, ls2
sub si, 1
mov cx, ls2 
repeta2:
	mov al, s2[si]
	mov d[di], al 
	sub si, 1
	add di, 1
loop repeta2
; Terminarea programului
mov ax, 4c00h
int 21h
text_ ENDS

END start
