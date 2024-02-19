ASSUME cs:text_,ds:data_

;Se da cuvântul A. Sa se obtina în B cuvântul rezultat prin rotirea spre dreapta (fara carry)
; a lui A cu atatea pozitii cât specifica valoarea în baza 10 a numarului binar cuprins între bitii 0-3 ai lui A.
data_ SEGMENT
a dw 1100101000000011b
b dw 0
; rez 0111100101000000
data_ ENDS

text_ SEGMENT

start:
mov ax, data_
mov ds, ax
; Evaluarea propriu-zisa a expresiei
mov cl, byte ptr a[0]; avem valoarea 3 cu care trb sa facem rotirea 
mov ax, a 
ror ax, cl
mov b, ax 
; Terminarea programului
mov ax, 4c00h
int 21h
text_ ENDS

END start
