ASSUME cs:code, ds:data

DATA segment
	cifre db '1234567890' ; șirul de cifre predefinit
    len equ $ - cifre
    msg db 13, 10, "Lungimea sirului predefinit: $"
    result_msg db 13, 10, "Program terminat.$"
DATA ends

CODE segment
start:
	mov ax, data
	mov ds, ax

 ; Afiseaza lungimea sirului predefinit
	mov ah, 9
	mov dx, offset msg
	int 21h

    ; Afiseaza mesajul la sfarsitul programului
	mov dx, offset result_msg
	int 21h


mov ax, 4C00h
int 21h

CODE ends
END start