
;2. Sa se citeasca cate un caracter de la tastatura, fara ecou. 
;Daca este cifra, sa se tipareasca pe ecran, 
;daca este caracterul '$', se termina programul, 
;in orice alta situatie se adauga caracterul 
;intr-un buffer care se va tipari in final pe ecran.

assume cs:code, ds:data
data segment
	cifre db ?
	sir db 20,?,20 dup(?); dim, cate au fost citite, datele
data ends
code segment
start:
	mov ax, data
	mov ds, ax
	; start cod 
	mov si, 2
	;citim pana gasim caracterul $
	citire:
		mov ah, 08h; citire fara ecou
		int 21h
		cmp al, '$'
		jne prelucrare
		je skip
		prelucrare:
			cmp al, '9'; verificam daca e cifra sau caracter
			jle cifra
			jg semn
			cifra:
				mov dl, al
				mov ah, 02h; afisam dl
				int 21h
				jmp citire
			semn:; adica orice nu e cifra
				mov sir[si], al 
				add si, 1
			jmp citire
		skip:
	;afisam caracterele 
	mov cx, si
	sub cx, 1
	mov si, 2
	afs:
		mov al, sir[si]
		mov dl, al 
		mov ah, 02h; afisam al
		int 21h
		add si, 1
	loop afs 
	mov ax, 4c00h
	int 21h
code ends 
end start