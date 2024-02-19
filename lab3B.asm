ASSUME cs:text_,ds:data_

data_ SEGMENT

A dd 7, 2889933, 987, 8643139
ls equ ($-A)/4; Ex: pentru 4 elemente o sa avem nevoie sa retinem tot 4 elemente in B1,B2
B1 db ls dup(0)
B2 db ls dup(0) 

data_ ENDS
text_ SEGMENT

;Se da un sir A de dublucuvinte. 
;Construiti doua siruri de octeti  
;B1: contine ca elemente partea inferioara a cuvintelor inferioara din A
;B2: contine ca elemente partea superioara a cuvintelor superioare din A 

start:
mov ax, data_
mov ds, ax

mov si, 0; contor A 
mov di, 0; contor B1 
mov cx, ls 
;pentru B1 ne intereseaza bitii de pe pozitiile 0, 4, 8, 12, ...
repeta:
	mov al, byte ptr A[si]
	mov B1[di], al
	add si, 4
	add di, 1
loop repeta ; La final avem sirul B1 format

mov si, 3; Ne intereseaza pozitiile 3, 7, 11, 15, ...
mov di, 0; contor B2
mov cx, ls 
repetaB2:
	mov al, byte ptr A[si]
	mov B2[di], al
	add si, 4
	add di, 1
loop repetaB2 ; La final avem sirul B1 format

; Terminarea programului
mov ax, 4c00h
int 21h
text_ ENDS

END start