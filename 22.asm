ASSUME cs:text_,ds:data_

data_ SEGMENT
a dw 0000000101000000b
b dw 0000001100100011b
c dw 0; rez : 1100 1001 1101 0000b
data_ ENDS

text_ SEGMENT

start:
mov ax, data_
mov ds, ax
; Evaluarea propriu-zisa a expresiei
;1 c3-c6
mov ax, a 
and ax, 0000000111100000b
shr ax, 2
;2 c7-c9
mov bx, b 
and bx, 0000000000000111b
shl bx, 7
;3 c11-c15
mov cx, b 
and cx, 0000001111100000b
shl cx, 6
;final
or c, ax 
or c, bx 
or c, cx 
 
; Terminarea programului
mov ax, 4c00h
int 21h
text_ ENDS

END start