ASSUME cs:text_,ds:data_

data_ SEGMENT

S db 1, 2, 4, 6, 10, 20, 25
l equ $ - s  ; Lungimea sirului S
D db l-1 dup(0)

data_ ENDS
text_ SEGMENT

;Se da un sir de octeti S de lungime l. Sa se construiasca sirul D de lungime l-1
; astfel incat elementele din D sa reprezinte diferenta dintre fiecare 2 elemente 
;consecutive din S. 
;Exemplu:
;S: 1, 2, 4, 6, 10, 20, 25
;D: 1, 2, 2, 4, 10, 5

start:
mov ax, data_
mov ds, ax
mov es, ax

mov CX, l - 1       ; Lungimea sirului S
mov SI, offset S 
mov DI, offset D
cld 
calculate_difference:
    lodsb
	mov bl, al
	lodsb
    sub al, bl        
    stosb       
loop calculate_difference

; Terminarea programului
mov ax, 4c00h
int 21h
text_ ENDS

END start