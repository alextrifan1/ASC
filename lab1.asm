ASSUME cs:text_,ds:data_

data_ SEGMENT
a db 1
b db 1
c db 1
d db 2
aux dw ?
rez dw ?
data_ ENDS

text_ SEGMENT

start:
mov ax, data_
mov ds, ax
; Evaluarea propriu-zisa a expresiei
;(a-b+d)^2
mov al, a
sub al, b
add al, d
mov bl, al
mul bl; ax = al*bl = (a-b+d)^2
;bx = ax
mov bx, ax; bx = (a-b+d)^2
;(a+b+c+1)^2
mov al, a
add al, b
add al, c 
add al, 1; al = a+b+c+1
mov cl, al 
mul cl; ax = (a+b+c+1)^2
mov dx, 0
div bx; dx:ax/bx
mov rez, ax
; Terminarea programului
mov ax, 4c00h
int 21h
text_ ENDS

END start
