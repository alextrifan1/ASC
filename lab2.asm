ASSUME cs:text_,ds:data_

data_ SEGMENT
a dw 0000111100000000b
b dw 0001100000000000b
c dw 0
data_ ENDS

text_ SEGMENT

start:
mov ax, data_
mov ds, ax
;Se dau cuvintele A si B. Sa se obtina cuvântul C:
; p1: bitii 0-3 ai lui C coincid cu bitii 8-11 ai lui A
; p2: bitii 4-10 ai lui C au valoarea 0
; p3: bitii 11-15 ai lui C coincid cu bitii 11-15 ai lui B

;p1
mov ax, a
and ax, 0000111100000000b; ax = 0000 a11 a10 a9 a8 000...0
shr ax, 8; ax = 0000 0000 0000 a11 a10 a9 a8

;p2 - c este initializat cu valoarea 0

;p3
mov bx, b 
and bx, 1111100000000000b; bx = b15 b14 b13 b12 b11 000...0

;punem totul in c 
or c, ax
or c, bx 
; Terminarea programului
mov ax, 4c00h
int 21h
text_ ENDS

END start
