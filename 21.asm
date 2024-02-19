ASSUME cs:text_,ds:data_

;Se dau doua cuvinte A si B. Sa se obtina cuvântul C:
;- bitii 0-2 ai lui C coincid cu bitii 7-9 ai lui A
;- bitii 3-6 ai lui C coincid cu bitii 9-12 ai lui B
;- bitii 7-15 ai lui C au valoarea 0
; c: c15 c14 c13 c12 c11 c10 c9 c8 c7 c6  c5  c4  c3 c2 c1 c0
; c: 0   0   0   0   0   0   0  0  0  b12 b11 b10 b9 a2 a1 a0

data_ SEGMENT

a dw 0000000000011111b
b dw 0000111000011111b
c dw 0; rez: 000000000111111b
 
data_ ENDS

text_ SEGMENT

start:
mov ax, data_
mov ds, ax
; ce e mai sus trebuie 
;p1 c0-c2
mov ax, a
and ax, 0000000000000111b
;p2 c3-c6
mov bx, b
and bx, 0001111000000000b
;p3 le punem in c
or c, ax 
or c, bx 
; Terminarea programului
mov ax, 4c00h
int 21h
text_ ENDS

END start