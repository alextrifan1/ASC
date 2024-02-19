;11. Se citeste de la tastatura o litera L. 
;Se da un sir de caractere in data segment. 
;Sa se inlocuiasca fiecare aparatie a lui L 
;in sirul din data segment cu litera X. Sa 
;se afiseze acest sir nou rezultat pe ecran.

;Se citeste de la tastatura un numar. 
;Sa se afiseze acest numar incrementat cu 1.

assume cs:code, ds:data
data segment
     L db ?
	 sir db 'anaaremere'
	 ls equ $-sir
	 msg_citire db 'citeste litera $'
data ends
code segment
start:
    mov ax, data
    mov ds, ax

	;afisam mesajul de citire
	mov ah, 09h
	mov dx, offset msg_citire
	int 21h
	;afisam linie noua
	mov ah, 02h
	mov dl, 10
	int 21h
	;citim L 
	mov ah, 01h
	int 21h
	mov L, al
	
	;parcurgem sirul 
	mov cx, ls 
	mov si, 0
	repeta:
		mov al, sir[si]
		cmp al, L 
		je egal
		jne skip
		egal:
			mov bl, 'X' 
			mov sir[si], bl 
		skip:
		add si, 1
	loop repeta 
	 
	mov sir[si], '$'
	;afisam linie nou si dupa sir
	mov ah, 02h
	mov dx, 10
	int 21h
	
	mov ah, 09h
	mov dx, offset sir
	int 21h
	
    ; Terminam programul
    mov ax, 4c00h
    int 21h

code ends
end start
