ASSUME cs:text_,ds:data_

;3. Sa se înlocuiasca primii trei biti ai cuvântului B cu ultimii trei biti ai octetului A.
 

data_ SEGMENT
a db 11100000b
b dw 0000000000001000b
aux dw 0
data_ ENDS

text_ SEGMENT

start:
mov ax, data_
mov ds, ax
; Evaluarea propriu-zisa a expresiei
 mov al, a 
 cbw
 shr ax, 5
 and ax, 0000000000000111b
 mov bx, b 
 and bx, 1111111111111000b
 or aux, ax 
 or aux, bx 
 mov cx, aux 
 mov b, cx
; Terminarea programului
mov ax, 4c00h
int 21h
text_ ENDS

END start