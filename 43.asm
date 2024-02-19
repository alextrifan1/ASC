;3. Se da un sir de litere mari si mici. 
;Sa se afiseze literele mici pe ecran si 
;sa se afiseze numarul acestor litere pe ecran.
assume cs:code, ds:data
data segment
	sir db 20,?,20 dup(?)
	nrCifre db 0
data ends
code segment
start:
	mov ax, data
	mov ds, ax
	; start cod 
	;citim sirul de litere
	mov ah, 0Ah
	mov dx, offset sir 
	int 21h
	;calculam l sir 
	mov al, byte ptr sir[1] 
	mov ah, 0
	mov cx, ax
	mov si, 2
	;parcurgem sirul 
	par: 
		mov al, sir[si]
		;sa fi mai mare sau egal cu a
		cmp al, 'a'
		jge litera 
		jl skip
		litera:
			;sa fie mai mic sau egal decat z
			cmp al, 'z'
			jle literaMica
			jg skip 
			literaMica:
				;afisam litera si crestem nr
				mov dl, al
				mov ah, 02h
				int 21h
				add nrCifre, 1
		skip:
		add si, 1
	loop par
	;afisam nr cifre
	mov dl, nrCifre
	add dl, '0'
	mov ah, 02h
	int 21h
	
	mov ax, 4c00h
	int 21h
code ends 
end start