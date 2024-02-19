ASSUME cs:text_,ds:data_

data_ SEGMENT
a db 5
b db 3
c db 2
d db 1
e db 3
data_ ENDS

text_ SEGMENT

start:
mov ax, data_
mov ds, ax
; Evaluarea propriu-zisa a expresiei: z=((a+b)/c + 2*d)/e

mov bl, c 
mov al, a 
add al, b
cbw 
div bl 
; al = (a+b)/c 

add al, d 
add al, d 

cbw 

mov cl, e
div cl 

; Terminarea programului
mov ax, 4c00h
int 21h
text_ ENDS

END start
