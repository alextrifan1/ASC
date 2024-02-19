ASSUME cs:code, ds:data

DATA segment
sir db 20,?,20 dup(0)
prompt db 'Introduceti sirul: $'
DATA ends

CODE segment
start:
mov ax, data
mov ds, ax

mov ah, 09h
lea dx, prompt
int 21h

mov ah, 0Ah
mov dx, offset sir
int 21h

; gasim lungimea
mov al, byte ptr sir[1] 
mov ah, 0
mov si, ax
add si, 2
mov sir[si], '$'

mov ah, 02h
mov dl, 10
int 21h

mov ah, 09h
mov dx, offset sir+2
int 21h

mov ax, 4C00h
int 21h

CODE ends
END start